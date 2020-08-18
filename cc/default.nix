{ pkgs, lib, bpPkgs, packageSrc, sourceDir, lookupPkg, resolveSrcs, genrule }:

with lib;
let
  recursiveMerge = attrList:
    let f = attrPath:
      zipAttrsWith (n: values:
        if tail values == []
          then head values
        else if all isList values
          then unique (concatLists values)
        else if all isAttrs values
          then f (attrPath ++ [n]) values
        else last values
      );
    in f [] attrList;

  # Normally, the downstream module overrides the "defaults" modules
  # Also do this recursively so we get "defaults" of "defaults"
  mergeDefaultArgs = args:
    recursiveMerge
      ((map (name: mergeDefaultArgs (lookupPkg name)) (args.defaults or [])) ++ [ args ]);
  mergeArchArgs = attrPath: args:
    recursiveMerge [ args (attrByPath attrPath {} args) ];
  setMissingDefaults = defaults: args: defaults // args;

  wrapModule = defaults: f: args: let
    p = subtractLists ((attrNames defaults) ++ [ "name" ]) (attrNames args);
  in traceIf (length p > 0) "unimplemented parameters in ${args.name}: ${builtins.toString p}" (wrapModuleNoCheck defaults f args);

  wrapModuleNoCheck = defaults: f: args: pipe args [
    mergeDefaultArgs

    # See soong/android/arch.go
    (mergeArchArgs [ "arch" arch ])
    (mergeArchArgs [ "multilib" "lib64" ])
    (mergeArchArgs [ "target" "host" ])
    (mergeArchArgs [ "target" "linux" ])
    (mergeArchArgs [ "target" "linux_glibc" ])
    (mergeArchArgs [ "target" "linux_${arch}" ])
    (mergeArchArgs [ "target" "not_windows" ])
    (mergeArchArgs [ "shared" ])
    (mergeArchArgs [ "static" ])
    (a: a // { inherit packageSrc; })
    (setMissingDefaults defaults)
    f
  ];

  arch =
    if pkgs.stdenv.isx86_64 then "x86_64"
    else if pkgs.stdenv.isx86_32 then "x86"
    else if pkgs.stdenv.isAarch64 then "arm64"
    else if pkgs.stdenv.isAarch32 then "arm"
    else throw "unhandled CPU architecture";


  llvmPackages = pkgs.llvmPackages_9;
  #clang = llvmPackages.libcxxClang;
  clang = llvmPackages.clang;
  llvm = llvmPackages.llvm;

  prebuilts = pkgs.stdenv.mkDerivation {
    name = "android-prebuilts";
    nativeBuildInputs = with pkgs; [ autoPatchelfHook makeWrapper ];
    propagatedBuildInputs = with pkgs; [ m4 ];
    src = sourceDir "prebuilts/build-tools/linux-x86";
    dontConfigure = true;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out
      cp -r $src/. $out
    '';
    preFixup = ''
      wrapProgram $out/bin/bison --prefix PATH : ${makeBinPath [ pkgs.m4 ]}
    '';
  };
  #bison = prebuilts;
  #flex = prebuilts;
  bison = pkgs.callPackage ./bison.nix {}; # Need bison 2 -- not 3
  flex = pkgs.flex;

  commonGlobalCflags = [
    "-DANDROID"
    "-fmessage-length=0"
    "-W"
    "-Wall"
    "-Wno-unused"
    "-Winit-self"
    "-Wpointer-arith"

    #  Make paths in deps files relative
    #"-no-canonical-prefixes"
    #"-fno-canonical-system-headers"

    "-DNDEBUG"
    "-UDEBUG"

    "-fno-exceptions"
    "-Wno-multichar"

    "-O2"
    "-g"

    "-fno-strict-aliasing"
  ];

  linuxCflags = [
    "-fdiagnostics-color"

    "-Wa,--noexecstack"

    "-fPIC"

    "-U_FORTIFY_SOURCE"
    "-D_FORTIFY_SOURCE=2"

    "-D__STDC_FORMAT_MACROS"
    "-D__STDC_CONSTANT_MACROS"
  ];

  # See build/soong/cc/config/clang.go
  clangExtraCFlags = [
    "-D__compiler_offsetof=__builtin_offsetof"

    # Emit address-significance table which allows linker to perform safe ICF. Clang does
    # not emit the table by default on Android since NDK still uses GNU binutils.
    "-faddrsig"

    # -Wimplicit-fallthrough is not enabled by -Wall.
    "-Wimplicit-fallthrough"

    # Help catch common 32/64-bit errors.
    "-Werror=int-conversion"

    # Disable overly aggressive warning for macros defined with a leading underscore
    # This happens in AndroidConfig.h, which is included nearly everywhere.
    # TODO: can we remove this now?
    "-Wno-reserved-id-macro"

    # Disable overly aggressive warning for format strings.
    # Bug: 20148343
    "-Wno-format-pedantic"

    # Workaround for ccache with clang.
    # See http://petereisentraut.blogspot.com/2011/05/ccache-and-clang.html.
    "-Wno-unused-command-line-argument"

    # Force clang to always output color diagnostics. Ninja will strip the ANSI
    # color codes if it is not running in a terminal.
    "-fcolor-diagnostics"

    # http://b/68236239 Allow 0/NULL instead of using nullptr everywhere.
    "-Wno-zero-as-null-pointer-constant"

    # Warnings from clang-7.0
    "-Wno-sign-compare"

    # Warnings from clang-8.0
    "-Wno-defaulted-function-deleted"

    # Disable -Winconsistent-missing-override until we can clean up the existing
    # codebase for it.
    "-Wno-inconsistent-missing-override"
  ];

  clangExtraCppFlags = [
    # Enable clang's thread-safety annotations in libcxx.
    # Turn off -Wthread-safety-negative, to avoid breaking projects that use -Weverything.
    "-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS"
    "-Wno-thread-safety-negative"

    # libc++'s math.h has an #include_next outside of system_headers.
    "-Wno-gnu-include-next"
  ];

  # Well this is unfortunate.
  commonGlobalIncludes = [
    ("-I" + sourceDir "system/core/include")
  ];

  hostLdLibs = "-ldl -lpthread -lm -lrt";

  #### Individual build rules. See soong/cc/builder.go. ####
  ld = { rsp, out, ldCmd ? "clang++", crtBegin ? "", libFlags ? [], crtEnd ? "", ldFlags ? [] }:
      "${clang}/bin/${ldCmd} @${rsp} ${escapeShellArgs libFlags} -o ${out} ${escapeShellArgs ldFlags} ${hostLdLibs} -Wl,--start-group -lgcc -lgcc_eh -lc -Wl,--end-group";

  cc = { src, out, ccCmd, cflags ? [] }:
    "${clang}/bin/${ccCmd} -c ${escapeShellArgs cflags} -o ${out} ${src}";

  splitExt = filename: let
    components = splitString "." filename;
    suffix = head (reverseList components);
  in if length components > 1
    then { root = removeSuffix ("." + suffix) filename; inherit suffix; }
    else { root = filename; suffix = ""; };

  mkObjectFile =
  { cflags, conlyflags, cppflags, asflags, yaccflags, aidlflags, include_build_directory, include_dirs, local_include_dirs, export_include_dirs,
    header_libs, shared_libs, static_libs, whole_static_libs, generated_headers,
    use_version_lib, gnu_extensions, c_std, cpp_std, srcs, generated_sources, ...
  }@args: src: let
    # src can be either a relative path to packageSrc, or an absolute path
    inherit (splitExt (removePrefix "/nix/store/" src)) root suffix;
    absSrc = if (hasPrefix "/" src || hasPrefix "./" src) then src else "${packageSrc}/${src}";

    langOptions = let
      stdBase = if gnu_extensions then "gnu" else "c";
      cStd =
        if c_std != ""
        then (if c_std == "experimental" then "${stdBase}11" else c_std)
        else "${stdBase}99";
      cppStd =
        if cpp_std != ""
        then (if cpp_std == "experimental" then "${stdBase}++2a" else cpp_std)
        else "${stdBase}++17";
    in if suffix == "c" then {
        ccCmd = "clang";
        cflags = [ "-std=${cStd}" ] ++ conlyflags;
      }
      else if elem suffix [ "cpp" "cc" ] then {
        ccCmd = "clang++";
        cflags = [ "-std=${cppStd}" ] ++ cppflags ++ clangExtraCppFlags;
      }
      else if elem suffix [ "s" "S" ] then {
        ccCmd = "clang";
        cflags = asflags ++ [ "-D__ASSEMBLY__" ];
      }
      else throw "unhandled extension for file: ${src}";

    stlOptions = {
      # We'll just do libc++_static for now
#      cflags = [ "-D_USING_LIBCXX" ];
#      cppflags = [ "-nostdinc++" ];
#      ldflags = [ "-nostdinc++" ];
    };

    includeFlags = let
      headerNames = (
        header_libs ++ shared_libs ++ static_libs ++ whole_static_libs
        ++ optional use_version_lib "libbuildversion"
      );
      allHeaderNames = unique (
        headerNames
        ++ (flatten (map (p:
          (bpPkgs.${p}.export_header_lib_headers or [])
          ++ (bpPkgs.${p}.export_shared_lib_headers or [])
          ++ (bpPkgs.${p}.export_static_lib_headers or [])
          ++ (bpPkgs.${p}.export_generated_headers or [])
          ++ (bpPkgs.${p}.whole_static_libs or [])) # This one is not well documented, but appears to be necessary (test: fastboot)
            headerNames)));
    in
      map (d: "-I${sourceDir d}") include_dirs # include_dirs appears to be a path relative to the AOSP root
      ++ map (d: "-I${packageSrc}/${d}") (local_include_dirs ++ export_include_dirs ++ (optional include_build_directory "."))
      ++ flatten (map (p: map (d: "-I${bpPkgs.${p}.packageSrc}/${d}") (bpPkgs.${p}.export_include_dirs or [])) allHeaderNames)
      ++ map (p: "-I${lookupPkg p}") generated_headers
      ++ optional (any (s: (hasSuffix ".y" s) || (hasSuffix ".yy" s)) srcs) "-I."; # Include header generated by yacc

    outSuffix =
      if suffix == "y" || suffix == "l" then "c"
      else if suffix == "yy" || suffix == "ll" || suffix == "aidl" then "cc"
      else "o";
  in {
    out = [ "${root}.o" ]
      ++ optionals (suffix == "y" || suffix == "yy") [ "${root}.h" ]
      ++ optionals (suffix == "y" || suffix == "yy" || suffix == "l" || suffix == "ll") [ "${root}.${outSuffix}" ];

    # Every other target potentially needs to have access to the .h file generated by yacc.
    deps = map (s: "${(splitExt s).root}.h") (filter (s: hasSuffix ".y" s || hasSuffix ".yy" s) srcs);
    cmd = if suffix == "asm" then
      "${pkgs.yasm}/bin/yasm ${escapeShellArgs asflags} ${escapeShellArgs includeFlags} -D__ASSEMBLY__ -o ${root}.o ${absSrc}"
    else if (suffix == "y" || suffix == "yy") then
      "BISON_PKGDATADIR=${sourceDir "prebuilts/build-tools/common/bison"} ${bison}/bin/bison -d ${escapeShellArgs yaccflags} --defines=${root}.h -o ${root}.${outSuffix} ${absSrc}"
      + " && " + (mkObjectFile args "./${root}.${outSuffix}").cmd
    else if (suffix == "l" || suffix == "ll") then
      "${flex}/bin/flex -o${root}.${outSuffix} ${absSrc}"
      + " && " + (mkObjectFile args "./${root}.${outSuffix}").cmd
    else if suffix == "aidl" then
      "${bpPkgs.aidl}/bin/aidl ${escapeShellArgs aidlflags} ${absSrc} ${root}.${outSuffix}"
      + " && " + (mkObjectFile args "./${root}.${outSuffix}").cmd
    else cc (recursiveMerge [
      {
        out = "${root}.o";
        src = absSrc;
        cflags =
          # The order here is important. See compilerFlags() in soong/cc/compiler.go
          commonGlobalCflags
          ++ linuxCflags
          ++ clangExtraCFlags
          ++ cflags
          ++ includeFlags
          ++ commonGlobalIncludes;
      }
      langOptions
      stlOptions
    ]);
  };

  mkMakefile = name: rules:
    pkgs.writeText "${name}-Makefile" (
      (concatMapStringsSep "\n\n" (rule:
        "${builtins.toString rule.out}: ${builtins.toString rule.deps}\n"
        + "\t" + (concatMapStringsSep " && " (f: "mkdir -p `dirname ${f}`") rule.out)
        + " && ${rule.cmd}")
      rules)
      + "\n\nall: " + (concatStringsSep " " (flatten (map (rule: rule.out) rules)))
      );

  mkRspfile = name: rules:
    pkgs.writeText "${name}.rsp"
      ((concatStringsSep "\n" (filter (f: hasSuffix ".o" f) (flatten (map (rule: rule.out) rules))))
    + "\n");

  cc_defaults = wrapModuleNoCheck {} (attrs: filterAttrs (n: v: n != "name") attrs);

  argDefaults = let
    cc_binary = {
      defaults = [];
      srcs = [];
      objs = [];

      cflags = [];
      conlyflags = [];
      cppflags = [];
      ldflags = [];
      asflags = [];
      yaccflags = [];
      aidlflags = [];

      include_build_directory = true;
      include_dirs = []; # Deprecated upstream
      local_include_dirs = [];
      export_include_dirs = [];
      generated_sources = [];

      header_libs = [];
      shared_libs = [];
      static_libs = [];
      whole_static_libs = [];
      generated_headers = [];

      export_header_lib_headers = [];
      export_shared_lib_headers = [];
      export_static_lib_headers = [];
      export_generated_headers = [];

      # Additional options that should be applied only when building as a static or shared library
      static = {};
      shared = {};

      use_version_lib = false;
      gnu_extensions = true;
      c_std = "";
      cpp_std = "";

      target = {};
      arch = {};

      host_supported = false;

      required = [];

      # To implement:
      recovery_available = false;
      vendor_available = false;
      dist = {}; # dist.targets contains a list of make targets this should be included in.

      # soongnix convenience arguments
      _build_static_lib = true;
      _build_shared_lib = true;
    };
  in {
    inherit cc_binary;
    cc_library = cc_binary;
    cc_library_headers = cc_binary;
  };

  # TODO: Extract commonality with cc_library
  cc_binary = wrapModule argDefaults.cc_binary
  ({ name, srcs, shared_libs, static_libs, whole_static_libs, use_version_lib, required, ... }@args:
  let
    _required = filter (m: m._is_binary or false) (map lookupPkg required);
  in pkgs.stdenv.mkDerivation {
      inherit name;
      passthru = { inherit args; _is_binary = true; } // args;

      dontUnpack = true;
      dontConfigure = true;
      dontInstall = true;

      buildPhase = let
        rules = map (src: mkObjectFile args src) (resolveSrcs srcs);
        makefile = mkMakefile name rules;
        rsp = mkRspfile name rules;

        # The ordering here with ensures that static_libs are linked in the correct order, with A before B if A depends on B.
        sortedStaticLibs = (toposort (a: b: elem b (bpPkgs.${a}.static_libs or []) || elem b (bpPkgs.${a}.shared_libs or [])) static_libs).result;
      in ''
        mkdir -p $out/bin
        make -j$NIX_BUILD_CORES -f${makefile} all
        ${ld {
          inherit rsp;
          out="$out/bin/${name}";
          libFlags =
            [ "-Wl,--whole-archive" ] # TODO: Only include this arg if the list below is nonempty
            ++ [ "-Wl,--no-whole-archive" ]
            ++ (map (p: "${lookupPkg p}/lib/${p}.so") shared_libs)
            ++ (map (p: "${lookupPkg p}/lib/${p}.a") sortedStaticLibs)
            ++ (map (p: "${lookupPkg p}/lib/${p}.a") (whole_static_libs ++ optional use_version_lib "libbuildversion"));
        }}
      '';

      # TODO: mke2fs has "mke2fs.conf" as a required module, but it is prebuilt_etc
      nativeBuildInputs = optional (_required != []) [ pkgs.makeWrapper ];
      preFixup = optionalString (_required != []) ''
        wrapProgram $out/bin/${name} --prefix PATH : ${makeBinPath _required}
      '';
  });

  cc_object = wrapModule argDefaults.cc_binary
  ({ name, srcs ? [], objs ? [], ... }@args:
  # Only support a single .c file, no other objs ATM.
  pkgs.runCommand "${name}.o" { passthru = args; } (''
  '' + (if srcs != [] then
    # TODO: Can there only be one src file?
    (mkObjectFile args (head (resolveSrcs srcs))) + ''
    cp $(cat $NIX_BUILD_TOP/out.rsp) $out
  '' else ''
    ${clang}/bin/clang -o $out ${escapeShellArgs (map lookupPkg objs)}
  '')));

  # Most of the interesting stuff is in soong/cc/builder.go
  cc_library = wrapModule argDefaults.cc_library (
    { name
    , srcs ? []
    , whole_static_libs
    , shared_libs
    , _build_static_lib
    , _build_shared_lib
    , ...
    }@args:
    pkgs.runCommandNoCC name {
      passthru = { inherit args; } // args;
    } (let
      rules = map (src: mkObjectFile args src) (resolveSrcs srcs);
      makefile = mkMakefile name rules;
      rsp = mkRspfile name rules;
    in ''
      make -j$NIX_BUILD_CORES -f${makefile} all

      # Unpack whole_static_libs into separate dirs and then repack their .o files into our new .a file
      cp ${rsp} out.rsp
      chmod u+w out.rsp
      ${concatMapStringsSep "\n" (s: ''
        EXTRACT_DIR=$(mktemp -d)
        pushd $EXTRACT_DIR >/dev/null
        ${llvm}/bin/llvm-ar x ${lookupPkg s}/lib/${s}.a
        popd >/dev/null
        find $EXTRACT_DIR -type f -iname '*.o' >> out.rsp
      '') whole_static_libs}

      mkdir -p $out/lib
      ${optionalString _build_static_lib "${llvm}/bin/llvm-ar crsD -format=gnu $out/lib/${name}.a @out.rsp" }
      ${optionalString _build_shared_lib (ld {
        rsp = "out.rsp";
        out="$out/lib/${name}.so";
        ldFlags = [ "-shared" "-Wl,-soname,${name}.so" ];
        libFlags = (map (p: "${lookupPkg p}/lib/${p}.so") shared_libs);
      }) }
    ''));

  cc_library_headers = wrapModule argDefaults.cc_library_headers id;
  cc_library_static = args: cc_library (args // { _build_shared_lib = false; _build_static_lib = true; });
  cc_library_shared = args: cc_library (args // { _build_shared_lib = true; _build_static_lib = true; });
  cc_library_host_static = args: cc_library_static (args // { host_supported = true; });
  cc_library_host_shared = args: cc_library_shared (args // { host_supported = true; });
  cc_binary_host = args: cc_binary (args // { host_supported = true; });

  cc_test = cc_binary;
  cc_test_host = args: cc_binary (recursiveMerge [ args { static_libs = [ "libgtest_main" "libgtest" ]; host_supported = true; } ]); # TODO: see linkerDeps under test.go
  cc_test_library = cc_library;
  cc_benchmark = args: cc_binary (recursiveMerge [ args { static_libs = [ "libgoogle-benchmark" ]; } ]);
  cc_benchmark_host = args: cc_binary_host (recursiveMerge [ args { static_libs = [ "libgoogle-benchmark" ]; host_supported = true;} ]);

  cc_genrule = wrapModule argDefaults.cc_binary genrule;
in {
  inherit
    cc_defaults
    cc_binary
    cc_binary_host
    cc_object
    cc_library
    cc_library_headers
    cc_library_static
    cc_library_shared
    cc_library_host_static
    cc_library_host_shared
    cc_test
    cc_test_host
    cc_test_library
    cc_benchmark
    cc_benchmark_host
    cc_genrule;
}

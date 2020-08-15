{ pkgs, lib, bpPkgs, sourceDirs, packageSrc, selectDir, resolveFiles, genrule }:

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


  # The ordering here with ensures that static_libs are linked in the correct order, with A before B if A depends on B.
  recursiveMergeWithStaticLibs = attrList:
    let f = attrPath:
      zipAttrsWith (n: values:
        if tail values == []
          then head values
        else if all isList values
          then unique (concatLists (if (hasSuffix "static_libs" n) then reverseList values else values))
        else if all isAttrs values
          then f (attrPath ++ [n]) values
        else last values
      );
    in f [] attrList;

  # Normally, the downstream module overrides the "defaults" modules
  # Also do this recursively so we get "defaults" of "defaults"
  mergeDefaultArgs = args: 
    recursiveMergeWithStaticLibs
      ((map (name: mergeDefaultArgs bpPkgs.${name}) (args.defaults or [])) ++ [ args ]);
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
  clang = llvmPackages.libcxxClang;
  llvm = llvmPackages.llvm;

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

#  ] ++ [
#    "--gcc-toolchain=${gccRoot}"
#    "--sysroot ${gccRoot}/sysroot"
#  ];
  #++ [
  #  "-B${gccRoot}/lib/gcc/x86_64-linux/4.8.3"
  #  "-L${gccRoot}/lib/gcc/x86_64-linux/4.8.3"
  #  "-L${gccRoot}/x86_64-linux/lib64"
  #];
  #gccRoot = sourceDirs."prebuilts/gcc" + "/linux-x86/host/x86_64-linux-glibc2.17-4.8";

  #linuxAvailableLibraries = [ "c" "dl" "gcc" "gcc_s" "m" "ncurses" "pthread" "resolv" "rt"

  # Well this is unfortunate.
  commonGlobalIncludes = [
    "-I${sourceDirs."system/core"}/include"
#    "-I${/home/danielrf/src/aosp/system/media}/audio/include"
#    "-I${/home/danielrf/src/aosp/hardware/libhardware}/include"
  ];

  hostLdLibs = "-ldl -lpthread -lm -lrt";

  #### Individual build rules. See soong/cc/builder.go. ####
  ld = { rsp, out, ldCmd ? "clang++", crtBegin ? "", libFlags ? [], crtEnd ? "", ldFlags ? [] }: ''
      ${clang}/bin/${ldCmd} @${rsp} ${escapeShellArgs libFlags} -o ${out} ${escapeShellArgs ldFlags} ${hostLdLibs} -Wl,--start-group -lgcc -lgcc_eh -lc -Wl,--end-group
    '';

  mkObjectFile =
  { cflags, conlyflags, cppflags, asflags, include_build_directory, include_dirs, local_include_dirs, export_include_dirs,
    header_libs, shared_libs, static_libs, whole_static_libs, generated_headers,
    use_version_lib, gnu_extensions, c_std, cpp_std, ...
  }: src: let
    components = splitString "." src;
    suffix = head (reverseList components);
    objectFilename = "$NIX_BUILD_TOP/" + (concatStringsSep "." (components ++ [ "o" ]));

    cc = { out, ccCmd, cflags ? [] }: ''
      mkdir -p $(dirname ${out})
      ${clang}/bin/${ccCmd} -c ${escapeShellArgs cflags} -o ${out} ${src}
    '';
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
      allHeaderNames =
        headerNames
        ++ (flatten (map (p:
          bpPkgs.${p}.export_header_lib_headers
          ++ bpPkgs.${p}.export_shared_lib_headers
          ++ bpPkgs.${p}.export_static_lib_headers
          ++ bpPkgs.${p}.export_generated_headers
          ++ bpPkgs.${p}.whole_static_libs) # This one is not well documented, but appears to be necessary (test: fastboot)
            headerNames));
    in
      map (d: "-I${selectDir d}") include_dirs # include_dirs appears to be a path relative to the AOSP root
      ++ map (d: "-I${packageSrc}/${d}") (local_include_dirs ++ export_include_dirs ++ (optional include_build_directory "."))
      ++ flatten (map (p: map (d: "-I${bpPkgs.${p}.packageSrc}/${d}") bpPkgs.${p}.export_include_dirs) allHeaderNames)
      ++ map (p: "-I${bpPkgs.${p}}") generated_headers;

  in if (hasSuffix ".asm" src) then ''
    mkdir -p $(dirname ${objectFilename})
    ${pkgs.yasm}/bin/yasm ${escapeShellArgs asflags} ${escapeShellArgs includeFlags} -D__ASSEMBLY__ -o ${objectFilename} ${src}
  '' else cc (recursiveMerge [
    {
      out = objectFilename;
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
  ]) + "\necho ${objectFilename} >> $NIX_BUILD_TOP/out.rsp";

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

      host_supported = true;

      # To implement:
      recovery_available = false;
      vendor_available = false;
      dist = {}; # dist.targets contains a list of make targets this should be included in.
      #required = [];

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
  ({ name, srcs, shared_libs, static_libs, whole_static_libs, use_version_lib, ...  }@args:
    pkgs.stdenv.mkDerivation {
      inherit name;
      passthru = { inherit args; } // args;

      dontUnpack = true;
      dontConfigure = true;
      dontInstall = true;

      buildPhase = ''
        set -x
        mkdir -p $out/bin
        NIX_BUILD_TOP=$TMP
        cd ${packageSrc}
        # TODO: Do this in parallel
        ${concatMapStringsSep "\n" (src: mkObjectFile args src) (resolveFiles srcs)}
        touch $NIX_BUILD_TOP/out.rsp
        ${ld {
          rsp="$NIX_BUILD_TOP/out.rsp";
          out="$out/bin/${name}";
          libFlags =
            [ "-Wl,--whole-archive" ] # TODO: Only include this arg if the list below is nonempty
            ++ [ "-Wl,--no-whole-archive" ]
            ++ (map (p: "${bpPkgs.${p}}/lib/${p}.so") shared_libs)
            ++ (map (p: "${bpPkgs.${p}}/lib/${p}.a") static_libs)
            ++ (map (p: "${bpPkgs.${p}}/lib/${p}.a") (whole_static_libs ++ optional use_version_lib "libbuildversion"));
        }}
      '';
  });

  cc_object = wrapModule argDefaults.cc_binary
  ({ name, srcs ? [], objs ? [], ... }@args:
  # Only support a single .c file, no other objs ATM.
  pkgs.runCommand "${name}.o" { passthru = args; } (''
    set -x
    cd ${packageSrc}
  '' + (if srcs != [] then
    # TODO: Can there only be one src file?
    (mkObjectFile args (head (resolveFiles srcs))) + ''
    cp $(cat $NIX_BUILD_TOP/out.rsp) $out
  '' else ''
    ${clang}/bin/clang -o $out ${escapeShellArgs (map (o: bpPkgs.${o}) objs)}
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
    } (''
      set -x
      cd ${packageSrc}
      # TODO: Do this in parallel
      ${concatMapStringsSep "\n" (src: mkObjectFile args src) (resolveFiles srcs)}

      # Unpack whole_static_libs into separate dirs and then repack their .o files into our new .a file
      ${concatMapStringsSep "\n" (s: ''
        EXTRACT_DIR=$(mktemp -d)
        pushd $EXTRACT_DIR >/dev/null
        ${llvm}/bin/llvm-ar x ${bpPkgs.${s}}/lib/${s}.a
        popd >/dev/null
        find $EXTRACT_DIR -type f -iname '*.o' >> $NIX_BUILD_TOP/out.rsp
      '') whole_static_libs}

      touch $NIX_BUILD_TOP/out.rsp
      mkdir -p $out/lib
      ${optionalString _build_static_lib "${llvm}/bin/llvm-ar crsD -format=gnu $out/lib/${name}.a @$NIX_BUILD_TOP/out.rsp" }
      ${optionalString _build_shared_lib (ld {
        rsp="$NIX_BUILD_TOP/out.rsp";
        out="$out/lib/${name}.so";
        ldFlags = [ "-shared" "-Wl,-soname,${name}.so" ];
        libFlags = (map (p: "${bpPkgs.${p}}/lib/${p}.so") shared_libs);
      }) }
    ''));

  cc_library_headers = wrapModule argDefaults.cc_library_headers id;
  cc_library_static = args: cc_library (args // { _build_shared_lib = false; _build_static_lib = true; });
  cc_library_shared = args: cc_library (args // { _build_shared_lib = true; _build_static_lib = true; });
  cc_library_host_static = cc_library_static;
  cc_library_host_shared = cc_library_shared;
  cc_binary_host = cc_binary;
  cc_test_library = cc_library;

  cc_test = id;
  cc_test_host = id;
  cc_benchmark = id;

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
    cc_test_library
    cc_genrule;
}

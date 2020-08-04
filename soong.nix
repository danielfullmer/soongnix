{ pkgs, lib, bpPkgs, sourceDirs, packageSrc }:

with lib;
let
  #clang = pkgs.llvmPackages.clang-unwrapped;
  clang = pkgs.clang_9;
  llvm = pkgs.llvm_9;

  # Need a better name for this. Replace string references to actual objects in bpPkgs
  # maybe it's too confusing and we should just dereference when we use it
  deref = value:
    if builtins.isString value then bpPkgs.${value}
    else if builtins.isList value then (builtins.map (v: deref v) value)
    else if builtins.isAttrs value then (mapAttrs (n: v: deref v) value)
    else throw "can't dereference attrs of this type";
  derefWrapper = attrs: f: args: let
    newArgs = mapAttrsRecursive (p: v: if builtins.elem (builtins.elemAt p ((length p)-1)) attrs then deref v else v) args;
  in f newArgs;

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


  mergeDefaultArgs = args: 
    # The ordering here with [ args ] before the defaults ensures that static_libs are linked in the correct order, with A before B if A depends on B.
    # TODO: We should probably make something more explicit for static_libs ensuring this
    recursiveMerge ([ args ] ++ (map (name: bpPkgs.${name}) (attrByPath ["defaults"] [] args)));
  mergeArchArgs = attrPath: args:
    recursiveMerge [ args (attrByPath attrPath {} args) ];
  setMissingDefaults = defaults: args: defaults // args;

  wrapModule = defaults: f: args: pipe args [
    mergeDefaultArgs

    # See soong/android/arch.go
    (mergeArchArgs [ "arch" "x86_64" ])
    (mergeArchArgs [ "multilib" "lib64" ])
    (mergeArchArgs [ "target" "host" ])
    (mergeArchArgs [ "target" "linux" ])
    (mergeArchArgs [ "target" "linux_glibc" ])
    (mergeArchArgs [ "target" "linux_x86_64" ])
    (mergeArchArgs [ "target" "not_windows" ])
    (a: a // { inherit packageSrc; })
    (setMissingDefaults defaults)
    f
  ];

  #aospBase = /home/danielrf/src/aosp;
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
      ${clang}/bin/${ldCmd} @${rsp} ${escapeShellArgs libFlags} -o ${out} ${escapeShellArgs ldFlags} -target x86_64-linux -pie ${hostLdLibs}  -Wl,--start-group -lgcc -lgcc_eh -lc -Wl,--end-group
    '';

  mkObjectFile =
  { cflags, conlyflags, cppflags, asflags, include_build_directory, include_dirs, local_include_dirs, export_include_dirs,
    header_libs, shared_libs, static_libs, whole_static_libs, generated_headers,
    use_version_lib, gnu_extensions, c_std, cpp_std, ...
  }: src: let
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
    in if hasSuffix ".c" src then {
        ccCmd = "clang";
        cflags = [ "-std=${cStd}" ] ++ conlyflags;
      }
      else if (hasSuffix ".cpp" src) || (hasSuffix ".cc" src) then {
        ccCmd = "clang++";
        cflags = [ "-std=${cppStd}" ] ++ cppflags ++ clangExtraCppFlags;
      }
      else if (hasSuffix ".s" src) || (hasSuffix ".S" src) then {
        ccCmd = "clang";
        cflags = asflags ++ [ "-D__ASSEMBLY__" ];
      }
      else throw "unhandled extension for file: ${src}";
    baseName = removeSuffix ".cpp" src;
    objectFilename = "$TOP/" + baseName + ".o";

    stlOptions = {
      # We'll just do libc++_static for now
#      cflags = [ "-D_USING_LIBCXX" ];
#      cppflags = [ "-nostdinc++" ];
#      ldflags = [ "-nostdinc++" ];
    };
  in cc (recursiveMerge [
    {
      out = objectFilename;
      cflags = let
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
        # The order here is important. See compilerFlags() in soong/cc/compiler.go
        commonGlobalCflags
        ++ linuxCflags
        ++ clangExtraCFlags
        ++ cflags
        ++ map (d: "-I${packageSrc}/${d}") (local_include_dirs ++ include_dirs ++ export_include_dirs ++ (optional include_build_directory "."))
        ++ map (p: map (d: "-I${bpPkgs.${p}.packageSrc}/${d}") bpPkgs.${p}.export_include_dirs) allHeaderNames
        ++ map (p: "-I${bpPkgs.${p}}") generated_headers
        ++ commonGlobalIncludes;
    }
    langOptions
    stlOptions
  ]) + "\necho ${objectFilename} >> $TOP/out.rsp";

  cc_defaults = wrapModule {} (attrs: filterAttrs (n: v: n != "name") attrs);

  argDefaults = let
    cc_binary = {
      srcs = [];

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

      use_version_lib = false;
      gnu_extensions = true;
      c_std = "";
      cpp_std = "";

      # soongnix convenience arguments
      _static_lib = true;
      _shared_lib = true;
    };
  in {
    inherit cc_binary;
    cc_library = cc_binary;
    cc_library_headers = cc_binary;
  };

  # TODO: Extract commonality with cc_library
  cc_binary = wrapModule argDefaults.cc_binary
  ({ name , srcs , shared_libs, static_libs, whole_static_libs, use_version_lib, ...  }@args:
    pkgs.stdenv.mkDerivation {
      inherit name;
      passthru = { inherit args; } // args;

      dontUnpack = true;
      dontConfigure = true;
      dontInstall = true;

      buildPhase = ''
        set -x
        mkdir -p $out/bin
        TOP=$TMP
        cd ${packageSrc}
        # TODO: Do this in parallel
        ${concatMapStringsSep "\n" (src: mkObjectFile args src) srcs}
        touch $TOP/out.rsp
        ${ld {
          rsp="$TOP/out.rsp";
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

  # Most of the interesting stuff is in soong/cc/builder.go
  cc_library = wrapModule argDefaults.cc_library (
    { name
    , srcs ? []
    , whole_static_libs
    , shared_libs
    , _static_lib
    , _shared_lib
    , ...
    }@args:
    pkgs.runCommandNoCC name {
      passthru = { inherit args; } // args;
    } (''
      set -x
      TOP=$TMP
      cd ${packageSrc}
      # TODO: Do this in parallel
      ${concatMapStringsSep "\n" (src: mkObjectFile args src) srcs}

      # Unpack whole_static_libs into separate dirs and then repack their .o files into our new .a file
      ${concatMapStringsSep "\n" (s: ''
        EXTRACT_DIR=$(mktemp -d)
        pushd $EXTRACT_DIR >/dev/null
        ${llvm}/bin/llvm-ar x ${bpPkgs.${s}}/lib/${s}.a
        popd >/dev/null
        find $EXTRACT_DIR -type f -iname '*.o' >> $TOP/out.rsp
      '') whole_static_libs}

      touch $TOP/out.rsp
      mkdir -p $out/lib
      ${optionalString _static_lib "${llvm}/bin/llvm-ar crsD -format=gnu $out/lib/${name}.a @$TOP/out.rsp" }
      ${optionalString _shared_lib (ld {
        rsp="$TOP/out.rsp";
        out="$out/lib/${name}.so";
        ldFlags = [ "-shared" "-Wl,-soname,${name}.so" ];
        libFlags = (map (p: "${bpPkgs.${p}}/lib/${p}.so") shared_libs);
      }) }
    ''));

  cc_library_headers = wrapModule argDefaults.cc_library_headers id;
  cc_library_static = args: cc_library (args // { _shared_lib = false; _static_lib = true; });
  cc_library_host_static = args: cc_library (args // { _shared_lib = false; _static_lib = true; });
  cc_library_shared = args: cc_library (args // { _shared_lib = true; _static_lib = true; });
  cc_binary_host = cc_binary;

  cc_test = id;
  cc_test_host = id;
  cc_benchmark = id;
  cc_object = id;

  genrule =
    ({ name, cmd, srcs, out, ... }:
    let
      outPaths = map (o: "$out/${o}") out;
    in
    # TODO: Replace all the options in the genrul docs
    pkgs.runCommandNoCC name {} ''
      mkdir -p $out
      cd ${packageSrc}
      ${replaceStrings [ "$(in)" "$(out)" ] [ (builtins.toString srcs) (builtins.toString outPaths) ] cmd}
    '');
  cc_genrule = genrule;

  python_defaults = id;
  python_binary_host = id;
  python_test_host = id;

  ndk_library = id;
  llndk_library = id;
  ndk_headers = id;
  prebuilt_etc = id;
in {
  inherit
  cc_defaults
  cc_binary
  cc_library
  cc_library_headers
  cc_library_static
  cc_library_host_static
  cc_library_shared
  cc_binary_host

  cc_test
  cc_test_host
  cc_test_library
  cc_benchmark
  cc_object

  genrule
  cc_genrule

  python_defaults
  python_binary_host
  python_test_host

  ndk_library
  llndk_library
  ndk_headers
  prebuilt_etc;
}

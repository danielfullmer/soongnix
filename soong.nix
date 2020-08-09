{ pkgs, lib, bpPkgs, sourceDirs, relpath }:

# TODO: Handle module "variants"

with lib;
let
  # Find the source dir with the longest name which matches a prefix of relpath
  selectDir = relpath:
  let
    matchingDirs = lib.filter (n: lib.hasPrefix n relpath) (lib.attrNames sourceDirs);
    bestDirName =
      assert lib.assertMsg ((builtins.length matchingDirs) >= 1) "Could not find soong module: ${relpath}";
      builtins.head (lib.sort (a: b: (lib.stringLength a) > (lib.stringLength b)) matchingDirs);
    remainingPath = builtins.substring (lib.stringLength bestDirName) (lib.stringLength relpath) relpath;
  in sourceDirs.${bestDirName} + remainingPath;

  packageSrc = selectDir relpath;
  llvmPackages = pkgs.llvmPackages_9;
  clang = llvmPackages.libcxxClang;
  llvm = llvmPackages.llvm;

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
    (mergeArchArgs [ "arch" "x86_64" ])
    (mergeArchArgs [ "multilib" "lib64" ])
    (mergeArchArgs [ "target" "host" ])
    (mergeArchArgs [ "target" "linux" ])
    (mergeArchArgs [ "target" "linux_glibc" ])
    (mergeArchArgs [ "target" "linux_x86_64" ])
    (mergeArchArgs [ "target" "not_windows" ])
    (mergeArchArgs [ "shared" ])
    (mergeArchArgs [ "static" ])
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
    # Hackily expand globs.
    cc = { ccCmd, cflags ? [] }: ''
      ( shopt -s failglob globstar
        for file in ${src}; do
          out=$NIX_BUILD_TOP/''${file%.*}.o
          mkdir -p $(dirname $out)
          ${clang}/bin/${ccCmd} -c ${escapeShellArgs cflags} -o $out $file
          echo $out >> $NIX_BUILD_TOP/out.rsp
        done
      )
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
    objectFilename = "$NIX_BUILD_TOP/" + baseName + ".o";

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
    echo ${objectFilename} >> $NIX_BUILD_TOP/out.rsp
  '' else cc (recursiveMerge [
    {
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

  genrule =
    ({ name, cmd, srcs, out, ... }@args:
    let
      outPaths = map (o: "$out/${o}") out;
    in
    # TODO: Replace all the options in the genrule docs
    pkgs.runCommandNoCC name {
      passthru = args;
    } ''
      mkdir -p $out
      cd ${packageSrc}
      ${replaceStrings [ "$(in)" "$(out)" ] [ (builtins.toString (resolveFiles srcs)) (builtins.toString outPaths) ] cmd}
    '');
  cc_genrule = wrapModule argDefaults.cc_binary genrule;

  # Upstream source says a "filegroup" is a collection of files that can be
  # referenced in other module propererties, like "srcs" using the syntax
  # ":<name>". This allows modules to refer to sources outside their package
  # boundaries.
  filegroup = id;
  resolveFiles = srcs: flatten (map (s: if hasPrefix ":" s then bpPkgs.${builtins.substring 1 (stringLength s) s}.srcs else s) srcs);

  art_cc_library = args: cc_library (recursiveMerge [
    args
    { # See art/build/art.go
      cflags = [
        "-O3"
        "-DART_DEFAULT_GC_TYPE=CMS"
        "-DIMT_SIZE=43"
        "-DART_USE_GENERATIONAL_CC=1"
        "-DART_DEFAULT_COMPACT_DEX_LEVEL=fast"
        "-DART_STACK_OVERFLOW_GAP_arm=8192"
        "-DART_STACK_OVERFLOW_GAP_arm64=8192"
        "-DART_STACK_OVERFLOW_GAP_mips=16384"
        "-DART_STACK_OVERFLOW_GAP_mips64=16384"
        "-DART_STACK_OVERFLOW_GAP_x86=8192"
        "-DART_STACK_OVERFLOW_GAP_x86_64=8192"
        "-DUSE_D8_DESUGAR=1"

        # host flags
        "-Wframe-larger-than=1736"
        "-DART_FRAME_SIZE_LIMIT=6400"
      ];
    }
  ]);

  art_cc_library_static = cc_library_static;
  art_cc_binary = cc_binary;
  art_cc_test = cc_test;
  art_cc_test_library = cc_test_library;
  art_cc_defaults = cc_defaults;
  libart_cc_defaults = cc_defaults;
  libart_static_cc_defaults = cc_defaults;
  art_global_defaults = cc_defaults;
  art_debug_defaults = cc_defaults;
  art_apex_test = id;

  unimplementedModule = name: builtins.trace "unimplemented module: ${name}" id;
in {
  inherit

  # Implemented
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
  genrule
  cc_genrule

  art_cc_library
  art_cc_library_static
  art_cc_binary
  art_cc_test
  art_cc_test_library
  art_cc_defaults
  libart_cc_defaults
  libart_static_cc_defaults
  art_global_defaults
  art_debug_defaults
  art_apex_test

  filegroup;
} // genAttrs [
  # android/soong/aidl
  "aidl_interface" "aidl_interfaces_metadata" "aidl_mapping"

  # android/soong/android
  "csuite_config" "makefile_goal" "package" "soong_config_bool_variable"
  "soong_config_module_type" "soong_config_module_type_import"
  "soong_config_string_variable" "soong_namespace" "vts_config"

  # android/soong/apex
  "apex" "apex_defaults" "apex_key" "apex_set" "apex_test" "apex_vndk"
  "override_apex" "prebuilt_apex"

  # android/soong/bpf
  "bpf"

  # android/soong/cc
  "cc_benchmark" "cc_benchmark_host" "cc_fuzz" "cc_prebuilt_binary"
  "cc_prebuilt_library" "cc_prebuilt_library_headers"
  "cc_prebuilt_library_shared" "cc_prebuilt_library_static"
  "cc_prebuilt_object" "cc_prebuilt_test_library_shared" "cc_test"
  "cc_test_host" "cc_test_library" "kernel_headers" "llndk_headers"
  "llndk_library" "ndk_headers" "ndk_library" "ndk_prebuilt_object"
  "ndk_prebuilt_shared_stl" "ndk_prebuilt_static_stl"
  "preprocessed_ndk_headers" "toolchain_library" "vendor_public_library"
  "vendor_snapshot_binary" "vendor_snapshot_header" "vendor_snapshot_object"
  "vendor_snapshot_shared" "vendor_snapshot_static" "versioned_ndk_headers"
  "vndk_libraries_txt" "vndk_prebuilt_shared"

  # android/soong/etc
  "prebuilt_dsp" "prebuilt_etc" "prebuilt_etc_host" "prebuilt_firmware"
  "prebuilt_font" "prebuilt_usr_share" "prebuilt_usr_share_host"

  # android/soong/external/clang
  "clang_binary_host" "clang_tblgen"

  # android/soong/external/llvm
  "force_build_llvm_components_defaults" "llvm_defaults" "llvm_tblgen"

  # android/soong/fs_config
  "target_fs_config_gen_filegroup"

  # android/soong/genrule
  "genrule_defaults" "gensrcs"

  # android/soong/hidl
  "hidl_interface" "hidl_interfaces_metadata" "hidl_package_root"
  "prebuilt_hidl_interfaces"

  # android/soong/java
  "android_app" "android_app_certificate" "android_app_import"
  "android_app_set" "android_library" "android_library_import"
  "android_robolectric_runtimes" "android_robolectric_test" "android_test"
  "android_test_helper_app" "android_test_import" "dex_import" "doc_defaults"
  "droiddoc" "droiddoc_exported_dir" "droiddoc_host" "droidstubs"
  "droidstubs_host" "global_compat_config" "hiddenapi_flags" "java_binary"
  "java_binary_host" "java_defaults" "java_device_for_host" "java_genrule"
  "java_genrule_host" "java_host_for_device" "java_import" "java_import_host"
  "java_library" "java_library_host" "java_library_static" "java_plugin"
  "java_sdk_library" "java_sdk_library_import" "java_system_modules"
  "java_system_modules_import" "java_test" "java_test_helper_library"
  "java_test_host" "java_test_import" "javadoc" "javadoc_host"
  "override_android_app" "override_android_test"
  "override_runtime_resource_overlay" "platform_compat_config" "prebuilt_apis"
  "prebuilt_stubs_sources" "runtime_resource_overlay" "stubs_defaults"
  "tradefed_java_library_host"

  # android/soong/phony
  "phony"

  # android/soong/prebuilts/clang/host/linux-x86/clangprebuilts
  "clang_builtin_headers" "libclang_rt_llndk_library"
  "libclang_rt_prebuilt_library_shared" "libclang_rt_prebuilt_library_static"
  "llvm_darwin_filegroup" "llvm_host_defaults"
  "llvm_host_prebuilt_library_shared" "llvm_prebuilt_library_static"

  # android/soong/python
  "python_binary_host" "python_defaults" "python_library" "python_library_host"
  "python_test" "python_test_host"

  # android/soong/rust
  "rust_binary" "rust_binary_host" "rust_bindgen" "rust_bindgen_host"
  "rust_defaults" "rust_ffi" "rust_ffi_host" "rust_ffi_host_shared"
  "rust_ffi_host_static" "rust_ffi_shared" "rust_ffi_static" "rust_library"
  "rust_library_dylib" "rust_library_host" "rust_library_host_dylib"
  "rust_library_host_rlib" "rust_library_rlib" "rust_prebuilt_dylib"
  "rust_prebuilt_library" "rust_prebuilt_rlib" "rust_proc_macro" "rust_test"
  "rust_test_host"

  # android/soong/sdk
  "module_exports" "module_exports_snapshot" "sdk" "sdk_snapshot"

  # android/soong/sh
  "sh_binary" "sh_binary_host" "sh_test" "sh_test_host"

  # android/soong/sysprop
  "sysprop_library"

  # android/soong/xml
  "prebuilt_etc_xml"

  # github.com/google/blueprint/bootstrap
  "blueprint_go_binary" "bootstrap_go_binary" "bootstrap_go_package"
] (name: unimplementedModule name)

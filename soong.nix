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

  # Upstream source says a "filegroup" is a collection of files that can be
  # referenced in other module propererties, like "srcs" using the syntax
  # ":<name>". This allows modules to refer to sources outside their package
  # boundaries.
  filegroup = id;
  resolveFiles = srcs: flatten (map (s: if hasPrefix ":" s then bpPkgs.${builtins.substring 1 (stringLength s) s}.srcs else s) srcs);

  art_cc_library = args: cc.cc_library (recursiveMerge [
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

  unimplementedModule = name: builtins.trace "unimplemented module: ${name}" id;

in {
  inherit filegroup genrule;
}
// (import ./cc { inherit pkgs lib bpPkgs sourceDirs packageSrc selectDir resolveFiles; })
// (import ./art { inherit lib cc; })
// genAttrs [
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

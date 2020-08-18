{ pkgs, lib, bpPkgs, sourceDirs, relpath }:

# TODO: Handle module "variants"

with lib;
let
  # Return a path containing the contents under the prefix
  sourceDir = prefix: if (selectDir prefix != false) then selectDir prefix else linkFarmDir prefix;

  # Find the source dir with the longest name which matches a prefix
  selectDir = prefix:
  let
    matchingDirs = lib.filter (n: lib.hasPrefix n prefix) (lib.attrNames sourceDirs);
    bestDirName = builtins.head (lib.sort (a: b: (lib.stringLength a) > (lib.stringLength b)) matchingDirs);
    remainingPath = builtins.substring (lib.stringLength bestDirName) (lib.stringLength prefix) prefix;
  in if (builtins.length matchingDirs) >= 1
    then sourceDirs.${bestDirName} + remainingPath
    else false;

  # Make a symlink tree of source directories whose prefix matches the one given
  linkFarmDir = prefix:
  let
    matchingDirs = lib.filterAttrs (n: v: lib.hasPrefix prefix n) sourceDirs;
    entries = mapAttrsToList (name: dir: {
      name = lib.removePrefix "/" (lib.removePrefix prefix name);
      path = dir;
    }) matchingDirs;
  in pkgs.linkFarm "${prefix}-linkfarm" entries;

  packageSrc = sourceDir relpath;

  lookupPkg = pkg: bpPkgs.${pkg} or (throw "couldn't find ${pkg}");

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

  wrapModule = f: args: pipe args [
    mergeDefaultArgs
    (a: a // { inherit packageSrc; })
    f
  ];

  genrule = wrapModule
    ({ name, cmd, srcs ? [], out, tools ? [], tool_files ? [], ... }@args:
    let
      lookupTool = tool:
        if elem tool tools then (lookupPkg tool) + "/bin/${tool}"
        else if elem tool tool_files then wrapTool "${packageSrc}/${tool}"
        else throw "missing tool: ${tool}";
      wrapTool = toolPath:
        if lib.hasSuffix ".py" toolPath
        then "${pkgs.python}/bin/python ${toolPath}"
        else toolPath;
      uniqueTool =
        if tools != [] then head tools
        else if tool_files != [] then head tool_files
        else false;
      substitutedCmd = let
        locationMatches = flatten (filter lib.isList (builtins.split "\\$\\(location ([^()]+?)\\)" cmd));
      in
      replaceStrings
        ([ "$$" "$(in)" "$(out)" "$(genDir)" ] ++ (optional (uniqueTool != false) "$(location)") ++ (map (m: "$(location ${m})") locationMatches))
        ([ "$"
          (builtins.toString (resolveSrcs srcs))
          "$out/${head out}" # If $(out) is used, there should only be one output
          "$PWD"
        ] ++ optional (uniqueTool != false) (lookupTool uniqueTool)
          ++ (map lookupTool locationMatches))
        cmd;
    in
    # TODO: Replace all the options in the genrule docs
    pkgs.runCommandNoCC name {
      passthru = args // { inherit packageSrc; _is_genrule = true; };
    } ''
      mkdir -p $(dirname $out/${head out})
      cd ${packageSrc}
      ${substitutedCmd}
    '');

  # Upstream source says a "filegroup" is a collection of files that can be
  # referenced in other module propererties, like "srcs" using the syntax
  # ":<name>". This allows modules to refer to sources outside their package
  # boundaries.
  filegroup = args: args // { inherit packageSrc; _is_filegroup = true; };

  # Produce absolute paths from the list of srcs, resolving ":" references
  resolveSrcs = srcs: flatten (map (s:
    let
      pkg = lookupPkg (removePrefix ":" s);
      files = if pkg._is_genrule or false then pkg.out else pkg.srcs;
    in if hasPrefix ":" s
    then map (file: "${pkg.packageSrc}/${file}") files
    else s)
  srcs);

  cc = import ./cc { inherit pkgs lib bpPkgs sourceDir packageSrc lookupPkg resolveSrcs genrule; };
  art = import ./art { inherit lib cc; };

  unimplementedModule = name: builtins.trace "unimplemented module: ${name}" id;

in {
  inherit filegroup genrule art_cc_library;
  llvm_tblgen = args: builtins.trace "unimplemented module: llvm_tblgen" (pkgs.runCommand "llvm-tblgen" { passthru = args; } "mkdir -p $out");
}
// cc // art // genAttrs [
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
  "cc_fuzz" "cc_prebuilt_binary"
  "cc_prebuilt_library" "cc_prebuilt_library_headers"
  "cc_prebuilt_library_shared" "cc_prebuilt_library_static"
  "cc_prebuilt_object" "cc_prebuilt_test_library_shared" "kernel_headers"
  "llndk_headers" "llndk_library" "ndk_headers" "ndk_library"
  "ndk_prebuilt_object" "ndk_prebuilt_shared_stl" "ndk_prebuilt_static_stl"
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
  "force_build_llvm_components_defaults" "llvm_defaults"

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

  "se_cil_compat_map" "se_filegroup"

  "generate_mojom_headers" "generate_mojom_pickles" "generate_mojom_srcjar"
  "generate_mojom_srcs"

  "tradefed_binary_host" "fluoride_defaults" "xsd_config" "ca_certificates" "ca_certificates_host"
  "display_go_defaults" "vintf_compatibility_matrix" "kernel_config" "sanitizer_status_library_shared"
  "wayland_protocol_codegen"
] (name: unimplementedModule name)

{ android_app_certificate, apex, apex_defaults, apex_key, art_apex_test, cc_prebuilt_binary, genrule, prebuilt_etc, python_binary_host, sh_binary }:
let

#  Android Runtime APEX module.

#  Modules listed in LOCAL_REQUIRED_MODULES for module art-runtime in art/Android.mk.
#  - Base requirements (binaries for which both 32- and 64-bit versions are built, if relevant).
art_runtime_base_binaries_both = [
    "dalvikvm"
];
#  - Base requirements (binaries for which a 32-bit version is preferred).
art_runtime_base_binaries_prefer32 = [
    "dex2oat"
    "dexoptanalyzer"
    "profman"
];
#  - Base requirements (libraries).
#
#  Note: ART on-device chroot-based testing and benchmarking is not yet using
#  the Runtime APEX, meaning that copies of some of these libraries have to be
#  installed in `/system` for the ART Buildbot set-up to work properly. This is
#  done by the `standalone-apex-files` Make phony target, used by the ART
#  Buildbot and Golem (see `art/Android.mk`). If you add libraries to this list,
#  you may have to also add them to `PRIVATE_RUNTIME_DEPENDENCY_LIBS` in
#  `art/Android.mk`.
#  TODO(b/121117762): Remove this note when both the ART Buildbot and Golem use
#  the Runtime APEX.
art_runtime_base_native_shared_libs = [
    #  External API (having APEX stubs).
    "libdexfile_external"
    "libnativebridge"
    "libnativehelper"
    "libnativeloader"
    #  libadbconnection is internal and loaded with dlopen(), but it cannot use
    #  "required" because of cyclic dependency (b/124505714).
    "libadbconnection"
    #  TODO(b/124476339): Clean up the following libraries once "required"
    #  dependencies work with APEX libraries.
    "libart"
    "libart-compiler"
    "libdt_fd_forward"
    "libdt_socket"
    "libjdwp"
    "libnpt"
    "libopenjdkjvm"
    "libopenjdkjvmti"
];
bionic_native_shared_libs = [
    #  External API (having APEX stubs).
    "libc"
    "libm"
    "libdl"
];

bionic_native_shared_libs_device = [
    #  ... and their internal dependencies
    #  These are available only on device
    "libc_malloc_debug"
    "libc_malloc_hooks"
];

bionic_binaries_both = [
    "linker"
];
#  - Debug variants (binaries for which a 32-bit version is preferred).
art_runtime_debug_binaries_prefer32 = [
    "dexoptanalyzerd"
    "profmand"
];
art_runtime_debug_binaries_prefer32_device = [
    "dex2oatd"
];
art_runtime_debug_binaries_both_host = [
    "dex2oatd"
];

#  - Debug variants (libraries).
art_runtime_debug_native_shared_libs = [
    "libadbconnectiond"
    "libartd"
    "libartd-compiler"
    "libopenjdkjvmd"
    "libopenjdkjvmtid"
];

#  Data files associated with bionic / managed core library APIs.
art_runtime_data_file_prebuilts = [
    "apex_tz_version"
    "apex_tzdata"
    "apex_tzlookup.xml"
    "apex_icu.dat"
];

#  Tools common to both device APEX and host APEX. Derived from art-tools in art/Android.mk.
art_tools_common_binaries = [
    "dexdump"
    "dexlist"
];

#  Tools common to both device and host debug APEXes.
art_tools_debug_binaries = [
    "dexdiag"
];

#  Tools exclusively for the device APEX derived from art-tools in art/Android.mk.
art_tools_device_only_binaries = [
    #  oatdump cannot link with host linux_bionic due to not using clang lld;
    #  TODO: Make it work with clang lld.
    "oatdump"
];
#  Same, but for only for debug packages.
art_tools_debug_device_only_binaries = [
    #  oatdumpd cannot link with host linux_bionic due to not using clang lld;
    #  TODO: Make it work with clang lld.
    "oatdumpd"
];

#  Tools exclusively for the host APEX derived from art-tools in art/Android.mk.
art_tools_host_only_binaries = [
    #  FIXME: Does not work as-is, because `ahat` is defined in tools/ahat/Android.mk
    #  (same issue as for `libart_fake` above).
    # "ahat",
    "hprof-conv"
];

#  Libraries needed to use com.android.runtime.host for zipapex run-tests
art_runtime_host_run_test_libs = [
    "libartd-disassembler"
];

#  Core Java libraries.
libcore_java_libs = [
    "core-oj"
    "core-libart"
    "okhttp"
    "bouncycastle"
    "apache-xml"
];

#  Native libraries that support the core Java libraries.
#
#  Note: ART on-device chroot-based testing and benchmarking is not yet using
#  the Runtime APEX, meaning that copies of some of these libraries have to be
#  installed in `/system` for the ART Buildbot set-up to work properly. This is
#  done by the `standalone-apex-files` Make phony target, used by the ART
#  Buildbot and Golem (see `art/Android.mk`). If you add libraries to this list,
#  you may have to also add them to `PRIVATE_RUNTIME_DEPENDENCY_LIBS` in
#  `art/Android.mk`.
#  TODO(b/121117762): Remove this note when both the ART Buildbot and Golem use
#  the Runtime APEX.
libcore_native_shared_libs = [
    #  External API (having APEX stubs).
    "libandroidicu"
    "libandroidio"
    #  TODO(b/124476339): Clean up the following libraries once "required"
    #  dependencies work with APEX libraries.
    "libexpat"
    "libicui18n"
    "libicuuc"
    "libjavacore"
    "libopenjdk"
];
libcore_debug_native_shared_libs = [
    "libopenjdkd"
];

libcore_native_device_only_shared_libs = [
    #  TODO(b/122876336): Remove libpac.so once it's migrated to Webview.
    #  libpac is used by frameworks, not by ART host.
    "libpac"
];

#  Temporary library includes for b/123591866 as all libraries are moved into the main art-apex.
art_runtime_libraries_zipapex = [
    "libnativebridge"
    "libnativeloader"
    "libnativehelper"
    "libcutils"
];

"com.android.runtime.key" = apex_key {
    name = "com.android.runtime.key";
    public_key = "com.android.runtime.avbpubkey";
    private_key = "com.android.runtime.pem";
};

"com.android.runtime.debug.certificate" = android_app_certificate {
    name = "com.android.runtime.debug.certificate";
    certificate = "com.android.runtime.debug";
};

"com.android.runtime.release.certificate" = android_app_certificate {
    name = "com.android.runtime.release.certificate";
    certificate = "com.android.runtime.release";
};

"com.android.runtime.ld.config.txt" = prebuilt_etc {
    name = "com.android.runtime.ld.config.txt";
    src = "ld.config.txt";
    filename = "ld.config.txt";
    installable = false;
};

"com.android.runtime-defaults" = apex_defaults {
    name = "com.android.runtime-defaults";
    compile_multilib = "both";
    manifest = "manifest.json";
    java_libs = libcore_java_libs;
    native_shared_libs = art_runtime_base_native_shared_libs ++
        bionic_native_shared_libs ++
        libcore_native_device_only_shared_libs ++
        libcore_native_shared_libs;
    multilib = {
        both = {
            binaries = art_runtime_base_binaries_both ++
                bionic_binaries_both;
        };
        prefer32 = {
            binaries = art_runtime_base_binaries_prefer32;
        };
        first = {
            binaries = art_tools_common_binaries ++
                art_tools_device_only_binaries;
        };
    };
    binaries = [
        "art_postinstall_hook"
        "art_preinstall_hook"
        "art_preinstall_hook_boot"
        "art_preinstall_hook_system_server"
        "art_prepostinstall_utils"
    ];
    prebuilts = art_runtime_data_file_prebuilts ++
        ["com.android.runtime.ld.config.txt"];
    key = "com.android.runtime.key";
    required = ["art_apex_boot_integrity"];
};

#  Release version of the Runtime APEX module (not containing debug
#  variants nor tools), included in user builds. Also used for
#  storage-constrained devices in userdebug and eng builds.
"com.android.runtime.release" = apex {
    name = "com.android.runtime.release";
    defaults = ["com.android.runtime-defaults"];
    native_shared_libs = bionic_native_shared_libs_device;
    certificate = ":com.android.runtime.release.certificate";
};

#  "Debug" version of the Runtime APEX module (containing both release and
#  debug variants, as well as additional tools), included in userdebug and
#  eng build.
"com.android.runtime.debug" = apex {
    name = "com.android.runtime.debug";
    defaults = ["com.android.runtime-defaults"];
    native_shared_libs = art_runtime_debug_native_shared_libs ++
        libcore_debug_native_shared_libs ++
        bionic_native_shared_libs_device;
    multilib = {
        prefer32 = {
            binaries = art_runtime_debug_binaries_prefer32 ++
                art_runtime_debug_binaries_prefer32_device;
        };
        first = {
            binaries = art_tools_debug_binaries ++
                art_tools_debug_device_only_binaries;
        };
    };
    certificate = ":com.android.runtime.debug.certificate";
};

#  TODO: Do this better. art_apex will disable host builds when
#  HOST_PREFER_32_BIT is set. We cannot simply use com.android.runtime.debug
#  because binaries have different multilib classes and 'multilib: {}' isn't
#  supported by target: { ... }.
#  See b/120617876 for more information.
"com.android.runtime.host" = art_apex_test {
    name = "com.android.runtime.host";
    compile_multilib = "both";
    payload_type = "zip";
    host_supported = true;
    device_supported = false;
    manifest = "manifest.json";
    java_libs = libcore_java_libs;
    ignore_system_library_special_case = true;
    native_shared_libs = art_runtime_base_native_shared_libs ++
        art_runtime_debug_native_shared_libs ++
        libcore_native_shared_libs ++
        libcore_debug_native_shared_libs ++
        art_runtime_libraries_zipapex ++
        art_runtime_host_run_test_libs;
    multilib = {
        both = {
            binaries = art_runtime_base_binaries_both ++
                art_runtime_debug_binaries_both_host;
        };
        first = {
            binaries = art_tools_common_binaries ++ #  Host APEX is always debug.
                art_tools_debug_binaries ++
                art_tools_host_only_binaries ++
                art_runtime_base_binaries_prefer32 ++
                art_runtime_debug_binaries_prefer32;
        };
    };
    key = "com.android.runtime.key";
    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
            multilib = {
                both = {
                    native_shared_libs = bionic_native_shared_libs;
                    binaries = bionic_binaries_both;
                };
            };
        };
    };
};

art-apex-tester = python_binary_host {
    name = "art-apex-tester";
    srcs = ["art_apex_test.py"];
    main = "art_apex_test.py";
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
        };
    };
};

#  Genrules so we can run the checker, and empty Java library so that it gets executed.

art-check-release-apex-gen = genrule {
    name = "art-check-release-apex-gen";
    srcs = [":com.android.runtime.release"];
    tools = [
        "art-apex-tester"
        "debugfs"
    ];
    cmd = "$(location art-apex-tester)" +
        " --debugfs $(location debugfs)" +
        " --tmpdir $(genDir)" +
        " $(in)" +
        " && touch $(out)";
    out = ["art-check-release-apex-gen.dummy"];
};

art-check-release-apex-gen-fakebin = cc_prebuilt_binary {
    name = "art-check-release-apex-gen-fakebin";
    srcs = [":art-check-release-apex-gen"];
    host_supported = true;
    device_supported = false;
    target = {
        darwin = {
            enabled = false; #  No python3.
        };
    };
};

art-check-debug-apex-gen = genrule {
    name = "art-check-debug-apex-gen";
    srcs = [":com.android.runtime.debug"];
    tools = [
        "art-apex-tester"
        "debugfs"
    ];
    cmd = "$(location art-apex-tester)" +
        " --debugfs $(location debugfs)" +
        " --tmpdir $(genDir)" +
        " --debug" +
        " $(in)" +
        " && touch $(out)";
    out = ["art-check-debug-apex-gen.dummy"];
};

art-check-debug-apex-gen-fakebin = cc_prebuilt_binary {
    name = "art-check-debug-apex-gen-fakebin";
    srcs = [":art-check-debug-apex-gen"];
    host_supported = true;
    device_supported = false;
    target = {
        darwin = {
            enabled = false; #  No python3.
        };
    };
};

#  Pre-install scripts.

art_preinstall_hook = sh_binary {
    name = "art_preinstall_hook";
    src = "art_preinstall_hook.sh";
};

art_preinstall_hook_boot = sh_binary {
    name = "art_preinstall_hook_boot";
    src = "art_preinstall_hook_boot.sh";
};

art_preinstall_hook_system_server = sh_binary {
    name = "art_preinstall_hook_system_server";
    src = "art_preinstall_hook_system_server.sh";
};

art_prepostinstall_utils = sh_binary {
    name = "art_prepostinstall_utils";
    src = "art_prepostinstall_utils.sh";
};

art_postinstall_hook = sh_binary {
    name = "art_postinstall_hook";
    src = "art_postinstall_hook.sh";
};

art_apex_boot_integrity = sh_binary {
    name = "art_apex_boot_integrity";
    src = "art_apex_boot_integrity.sh";
    init_rc = ["art_apex_boot_integrity.rc"];
};

in { inherit "com.android.runtime-defaults" "com.android.runtime.debug" "com.android.runtime.debug.certificate" "com.android.runtime.host" "com.android.runtime.key" "com.android.runtime.ld.config.txt" "com.android.runtime.release" "com.android.runtime.release.certificate" art-apex-tester art-check-debug-apex-gen art-check-debug-apex-gen-fakebin art-check-release-apex-gen art-check-release-apex-gen-fakebin art_apex_boot_integrity art_postinstall_hook art_preinstall_hook art_preinstall_hook_boot art_preinstall_hook_system_server art_prepostinstall_utils; }

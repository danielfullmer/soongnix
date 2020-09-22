{ android_app_certificate, apex_defaults, apex_key, art_apex, art_apex_test, art_apex_test_host, cc_defaults, cc_prebuilt_binary, genrule, genrule_defaults, prebuilt_etc, python_binary_host }:
let

#  ART APEX module
#
#  Contains both the Android Managed Runtime (ART) and the Android Core Library
#  (Libcore).

#  Modules listed in LOCAL_REQUIRED_MODULES for module art-runtime in art/Android.mk.
#  - Base requirements (binaries for which both 32- and 64-bit versions are built, if relevant).
art_runtime_base_binaries_both = [
    "dalvikvm"
];
art_runtime_base_binaries_both_on_device_first_on_host = [
    "dex2oat"
];
#  - Base requirements (binaries for which a 32-bit version is preferred on device, but for which
#    only the "first" (likely 64-bit) version is required on host).
art_runtime_base_binaries_prefer32_on_device_first_on_host = [
    "dexoptanalyzer"
    "profman"
];
#  - Base requirements (libraries).
#
#  Note: ART on-device chroot-based testing and benchmarking is not yet using
#  the ART APEX, meaning that copies of some of these libraries have to be
#  installed in `/system` for the ART Buildbot set-up to work properly. This is
#  done by the `standalone-apex-files` Make phony target, used by the ART
#  Buildbot and Golem (see `art/Android.mk`). If you add libraries to this list,
#  you may have to also add them to `PRIVATE_ART_APEX_DEPENDENCY_LIBS` in
#  `art/Android.mk`.
#  TODO(b/121117762): Remove this note when both the ART Buildbot and Golem use
#  the ART APEX.
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

art_runtime_base_native_device_only_shared_libs = [
    "libperfetto_hprof"
];

bionic_native_shared_libs = [
    #  External API (having APEX stubs).
    "libc"
    "libm"
    "libdl"
];

bionic_binaries_both = [
    "linker"
];

#  - Debug variants (binaries for which a 32-bit version is preferred on device, but for which
#    only the "first" (likely 64-bit) version is required on host).
art_runtime_debug_binaries_prefer32_on_device_first_on_host = [
    "dexoptanalyzerd"
    "profmand"
];
art_runtime_debug_binaries_both_on_device_first_on_host = [
    "dex2oatd"
];

#  - Debug variants (libraries).
art_runtime_debug_native_shared_libs = [
    "libadbconnectiond"
    "libartd"
    "libartd-compiler"
    "libdexfiled_external"
    "libopenjdkjvmd"
    "libopenjdkjvmtid"
];

art_runtime_base_native_device_only_debug_shared_libs = [
    "libperfetto_hprofd"
];

#  Libraries needed to execute ART run-tests.
#  TODO(b/124476339): When bug 124476339 is fixed, add these libraries as `runtime_libs`
#  dependencies of `libartd-compiler`, and remove `art_runtime_run_test_libs`.
art_runtime_run_test_libs = [
    "libart-disassembler"
    "libartd-disassembler"
];

#  Tools common to both device APEX and host APEX. Derived from art-tools in art/Android.mk.
art_tools_common_binaries = [
    "dexdump"
    "dexlist"
];

#  Tools common to both device and host debug APEXes.
art_tools_debug_binaries = [
    "dexanalyze"
    "dexdiag"
    "dexlayout"
    "dexlayoutd"
];

art_tools_debug_binaries_both = [
    "imgdiag"
    "imgdiagd"
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

#  Core Java libraries.
libcore_java_libs = [
    "core-oj"
    "core-libart"
    "core-icu4j"
    "okhttp"
    "bouncycastle"
    "apache-xml"
];

#  Native libraries that support the core Java libraries.
#
#  Note: ART on-device chroot-based testing and benchmarking is not yet using
#  the ART APEX, meaning that copies of some of these libraries have to be
#  installed in `/system` for the ART Buildbot set-up to work properly. This is
#  done by the `standalone-apex-files` Make phony target, used by the ART
#  Buildbot and Golem (see `art/Android.mk`). If you add libraries to this list,
#  you may have to also add them to `PRIVATE_ART_APEX_DEPENDENCY_LIBS` in
#  `art/Android.mk`.
#  TODO(b/121117762): Remove this note when both the ART Buildbot and Golem use
#  the ART APEX.
libcore_native_shared_libs = [
    #  External API (having APEX stubs).
    "libandroidicu"
    "libandroidio"
    #  TODO(b/124476339): Clean up the following libraries once "required"
    #  dependencies work with APEX libraries.
    "libexpat"
    "libicui18n"
    "libicuuc"
    "libicu_jni"
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

"com.android.art.certificate" = android_app_certificate {
    name = "com.android.art.certificate";
    certificate = "com.android.art";
};

"com.android.art.key" = apex_key {
    name = "com.android.art.key";
    public_key = "com.android.art.avbpubkey";
    private_key = "com.android.art.pem";
};

"com.android.art.ld.config.txt" = prebuilt_etc {
    name = "com.android.art.ld.config.txt";
    src = "ld.config.txt";
    filename = "ld.config.txt";
    installable = false;
};

#  Default values shared by device ART APEXes.
"com.android.art-defaults" = apex_defaults {
    name = "com.android.art-defaults";
    compile_multilib = "both";
    manifest = "manifest-art.json";
    java_libs = libcore_java_libs;
    native_shared_libs = art_runtime_base_native_shared_libs ++
        art_runtime_base_native_device_only_shared_libs ++
        libcore_native_device_only_shared_libs ++
        libcore_native_shared_libs;
    multilib = {
        both = {
            binaries = art_runtime_base_binaries_both ++
                art_runtime_base_binaries_both_on_device_first_on_host;
        };
        prefer32 = {
            binaries = art_runtime_base_binaries_prefer32_on_device_first_on_host;
        };
        first = {
            binaries = art_tools_common_binaries ++
                art_tools_device_only_binaries;
        };
    };
    prebuilts = ["com.android.art.ld.config.txt"];
    key = "com.android.art.key";
    required = [
        "art_apex_boot_integrity"
        "com.android.i18n"
    ];
};

#  Default values shared by (device) Debug and Testing ART APEXes.
"com.android.art-dev-defaults" = apex_defaults {
    name = "com.android.art-dev-defaults";
    defaults = ["com.android.art-defaults"];
    native_shared_libs = art_runtime_base_native_device_only_debug_shared_libs ++
        art_runtime_run_test_libs ++
        art_runtime_debug_native_shared_libs ++
        libcore_debug_native_shared_libs;
    multilib = {
        both = {
            binaries = art_tools_debug_binaries_both ++
                art_runtime_debug_binaries_both_on_device_first_on_host;
        };
        prefer32 = {
            binaries = art_runtime_debug_binaries_prefer32_on_device_first_on_host;
        };
        first = {
            binaries = art_tools_debug_binaries ++
                art_tools_debug_device_only_binaries;
        };
    };
};

#  Release version of the ART APEX module (not containing debug
#  variants nor tools), included in user builds. Also used for
#  storage-constrained devices in userdebug and eng builds.
"com.android.art.release" = art_apex {
    name = "com.android.art.release";
    defaults = ["com.android.art-defaults"];
    certificate = ":com.android.art.certificate";
};

#  "Debug" version of the ART APEX module (containing both release and
#  debug variants, as well as additional tools), included in userdebug and
#  eng build.
"com.android.art.debug" = art_apex {
    name = "com.android.art.debug";
    defaults = ["com.android.art-dev-defaults"];
    certificate = ":com.android.art.certificate";
};

#  ART gtests with dependencies on internal ART APEX libraries.
art_gtests = [
    "art_cmdline_tests"
    "art_compiler_tests"
    "art_dex2oat_tests"
    "art_dexanalyze_tests"
    "art_dexdiag_tests"
    "art_dexdump_tests"
    "art_dexlayout_tests"
    "art_dexlist_tests"
    "art_dexoptanalyzer_tests"
    "art_imgdiag_tests"
    "art_libartbase_tests"
    "art_libartpalette_tests"
    "art_libdexfile_tests"
    "art_libdexfile_support_tests"
    "art_libprofile_tests"
    "art_oatdump_tests"
    "art_profman_tests"
    "art_runtime_compiler_tests"
    "art_runtime_tests"
    "art_sigchain_tests"
];

#  "Testing" version of the ART APEX module (containing both release
#  and debug variants, additional tools, and ART gtests), for testing
#  purposes only.
"com.android.art.testing" = art_apex_test {
    name = "com.android.art.testing";
    defaults = ["com.android.art-dev-defaults"];
    file_contexts = ":com.android.art.debug-file_contexts";
    certificate = ":com.android.art.certificate";
    tests = art_gtests;
    binaries = ["signal_dumper"]; #  Need signal_dumper for run-tests.
};

#  TODO: Do this better. art_apex_test_host will disable host builds when
#  HOST_PREFER_32_BIT is set. We cannot simply use com.android.art.debug
#  because binaries have different multilib classes and 'multilib: {}' isn't
#  supported by target: { ... }.
#  See b/120617876 for more information.
"com.android.art.host" = art_apex_test_host {
    name = "com.android.art.host";
    compile_multilib = "both";
    payload_type = "zip";
    host_supported = true;
    device_supported = false;
    manifest = "manifest-art.json";
    java_libs = libcore_java_libs;
    ignore_system_library_special_case = true;
    native_shared_libs = art_runtime_base_native_shared_libs ++
        art_runtime_debug_native_shared_libs ++
        libcore_native_shared_libs ++
        libcore_debug_native_shared_libs ++
        art_runtime_libraries_zipapex ++
        art_runtime_run_test_libs;
    multilib = {
        both = {
            binaries = art_runtime_base_binaries_both ++
                art_tools_debug_binaries_both;
        };
        first = {
            binaries = art_runtime_base_binaries_prefer32_on_device_first_on_host ++
                art_runtime_base_binaries_both_on_device_first_on_host ++
                art_runtime_debug_binaries_prefer32_on_device_first_on_host ++
                art_runtime_debug_binaries_both_on_device_first_on_host ++
                art_tools_common_binaries ++
                art_tools_debug_binaries ++ #  Host APEX is always debug.
                art_tools_host_only_binaries;
        };
    };
    key = "com.android.art.key";
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
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

#  Genrules so we can run the checker, and empty Java library so that it gets executed.

art_check_apex_gen_stem = "$(location art-apex-tester)" +
    " --debugfs $(location debugfs)" +
    " --tmpdir $(genDir)";

#  The non-flattened APEXes are always checked, as they are always generated
#  (even when APEX flattening is enabled).
art-check-apex-gen-defaults = genrule_defaults {
    name = "art-check-apex-gen-defaults";
    tools = [
        "art-apex-tester"
        "debugfs"
    ];
};

art-check-apex-gen-fakebin-defaults = cc_defaults {
    name = "art-check-apex-gen-fakebin-defaults";
    host_supported = true;
    device_supported = false;
    target = {
        darwin = {
            enabled = false; #  No python3.
        };
    };
};

art-check-release-apex-gen = genrule {
    name = "art-check-release-apex-gen";
    defaults = ["art-check-apex-gen-defaults"];
    srcs = [":com.android.art.release"];
    cmd = art_check_apex_gen_stem +
        " --flavor release" +
        " $(in)" +
        " && touch $(out)";
    out = ["art-check-release-apex-gen.dummy"];
};

art-check-release-apex-gen-fakebin = cc_prebuilt_binary {
    name = "art-check-release-apex-gen-fakebin";
    defaults = ["art-check-apex-gen-fakebin-defaults"];
    srcs = [":art-check-release-apex-gen"];
};

art-check-debug-apex-gen = genrule {
    name = "art-check-debug-apex-gen";
    defaults = ["art-check-apex-gen-defaults"];
    srcs = [":com.android.art.debug"];
    cmd = art_check_apex_gen_stem +
        " --flavor debug" +
        " $(in)" +
        " && touch $(out)";
    out = ["art-check-debug-apex-gen.dummy"];
};

art-check-debug-apex-gen-fakebin = cc_prebuilt_binary {
    name = "art-check-debug-apex-gen-fakebin";
    defaults = ["art-check-apex-gen-fakebin-defaults"];
    srcs = [":art-check-debug-apex-gen"];
};

art-check-testing-apex-gen = genrule {
    name = "art-check-testing-apex-gen";
    defaults = ["art-check-apex-gen-defaults"];
    srcs = [":com.android.art.testing"];
    cmd = art_check_apex_gen_stem +
        " --flavor testing" +
        " $(in)" +
        " && touch $(out)";
    out = ["art-check-testing-apex-gen.dummy"];
};

art-check-testing-apex-gen-fakebin = cc_prebuilt_binary {
    name = "art-check-testing-apex-gen-fakebin";
    defaults = ["art-check-apex-gen-fakebin-defaults"];
    srcs = [":art-check-testing-apex-gen"];
};

in { inherit "com.android.art-defaults" "com.android.art-dev-defaults" "com.android.art.certificate" "com.android.art.debug" "com.android.art.host" "com.android.art.key" "com.android.art.ld.config.txt" "com.android.art.release" "com.android.art.testing" art-apex-tester art-check-apex-gen-defaults art-check-apex-gen-fakebin-defaults art-check-debug-apex-gen art-check-debug-apex-gen-fakebin art-check-release-apex-gen art-check-release-apex-gen-fakebin art-check-testing-apex-gen art-check-testing-apex-gen-fakebin; }

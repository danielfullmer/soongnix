{ bootstrap_go_package, cc_defaults, cc_genrule, kernel_headers, toolchain_library }:
let

subdirs = [
    "androidmk"
    "bpfix"
    "cmd/*"
    "fs"
    "finder"
    "jar"
    "zip"
    "third_party/zip"
    "ui/*"
];

soong-env = bootstrap_go_package {
    name = "soong-env";
    pkgPath = "android/soong/env";
    srcs = [
        "env/env.go"
    ];
};

soong = bootstrap_go_package {
    name = "soong";
    pkgPath = "android/soong";
    deps = [
        "blueprint"
    ];
    srcs = [
        "doc.go"
    ];
};

soong-android = bootstrap_go_package {
    name = "soong-android";
    pkgPath = "android/soong/android";
    deps = [
        "blueprint"
        "blueprint-bootstrap"
        "soong"
        "soong-env"
        "soong-shared"
    ];
    srcs = [
        "android/androidmk.go"
        "android/apex.go"
        "android/api_levels.go"
        "android/arch.go"
        "android/config.go"
        "android/defaults.go"
        "android/defs.go"
        "android/expand.go"
        "android/filegroup.go"
        "android/hooks.go"
        "android/makevars.go"
        "android/module.go"
        "android/mutator.go"
        "android/namespace.go"
        "android/neverallow.go"
        "android/notices.go"
        "android/onceper.go"
        "android/override_module.go"
        "android/package_ctx.go"
        "android/path_properties.go"
        "android/paths.go"
        "android/prebuilt.go"
        "android/prebuilt_etc.go"
        "android/proto.go"
        "android/register.go"
        "android/rule_builder.go"
        "android/sh_binary.go"
        "android/singleton.go"
        "android/testing.go"
        "android/util.go"
        "android/variable.go"
        "android/vts_config.go"
        "android/writedocs.go"

        #  Lock down environment access last
        "android/env.go"
    ];
    testSrcs = [
        "android/arch_test.go"
        "android/config_test.go"
        "android/expand_test.go"
        "android/namespace_test.go"
        "android/neverallow_test.go"
        "android/onceper_test.go"
        "android/path_properties_test.go"
        "android/paths_test.go"
        "android/prebuilt_test.go"
        "android/prebuilt_etc_test.go"
        "android/rule_builder_test.go"
        "android/util_test.go"
        "android/variable_test.go"
        "android/vts_config_test.go"
    ];
};

soong-cc-config = bootstrap_go_package {
    name = "soong-cc-config";
    pkgPath = "android/soong/cc/config";
    deps = [
        "soong-android"
    ];
    srcs = [
        "cc/config/clang.go"
        "cc/config/global.go"
        "cc/config/tidy.go"
        "cc/config/toolchain.go"
        "cc/config/vndk.go"

        "cc/config/arm_device.go"
        "cc/config/arm64_device.go"
        "cc/config/arm64_fuchsia_device.go"
        "cc/config/mips_device.go"
        "cc/config/mips64_device.go"
        "cc/config/x86_device.go"
        "cc/config/x86_64_device.go"
        "cc/config/x86_64_fuchsia_device.go"

        "cc/config/x86_darwin_host.go"
        "cc/config/x86_linux_host.go"
        "cc/config/x86_linux_bionic_host.go"
        "cc/config/x86_windows_host.go"
    ];
    testSrcs = [
        "cc/config/tidy_test.go"
    ];
};

soong-cc = bootstrap_go_package {
    name = "soong-cc";
    pkgPath = "android/soong/cc";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc-config"
        "soong-genrule"
        "soong-tradefed"
    ];
    srcs = [
        "cc/androidmk.go"
        "cc/builder.go"
        "cc/cc.go"
        "cc/check.go"
        "cc/coverage.go"
        "cc/gen.go"
        "cc/lto.go"
        "cc/makevars.go"
        "cc/pgo.go"
        "cc/prebuilt.go"
        "cc/proto.go"
        "cc/rs.go"
        "cc/sanitize.go"
        "cc/sabi.go"
        "cc/stl.go"
        "cc/strip.go"
        "cc/sysprop.go"
        "cc/tidy.go"
        "cc/util.go"
        "cc/vndk.go"
        "cc/vndk_prebuilt.go"
        "cc/xom.go"

        "cc/cmakelists.go"
        "cc/compdb.go"
        "cc/compiler.go"
        "cc/installer.go"
        "cc/linker.go"

        "cc/binary.go"
        "cc/library.go"
        "cc/object.go"
        "cc/test.go"
        "cc/toolchain_library.go"

        "cc/ndk_prebuilt.go"
        "cc/ndk_headers.go"
        "cc/ndk_library.go"
        "cc/ndk_sysroot.go"

        "cc/llndk_library.go"

        "cc/kernel_headers.go"

        "cc/genrule.go"

        "cc/vendor_public_library.go"

        "cc/testing.go"
    ];
    testSrcs = [
        "cc/cc_test.go"
        "cc/gen_test.go"
        "cc/genrule_test.go"
        "cc/library_test.go"
        "cc/prebuilt_test.go"
        "cc/proto_test.go"
        "cc/test_data_test.go"
        "cc/util_test.go"
    ];
    pluginFor = ["soong_build"];
};

soong-genrule = bootstrap_go_package {
    name = "soong-genrule";
    pkgPath = "android/soong/genrule";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-shared"
    ];
    srcs = [
        "genrule/genrule.go"
    ];
    testSrcs = [
        "genrule/genrule_test.go"
    ];
    pluginFor = ["soong_build"];
};

soong-phony = bootstrap_go_package {
    name = "soong-phony";
    pkgPath = "android/soong/phony";
    deps = [
        "blueprint"
        "soong-android"
    ];
    srcs = [
        "phony/phony.go"
    ];
    pluginFor = ["soong_build"];
};

soong-java = bootstrap_go_package {
    name = "soong-java";
    pkgPath = "android/soong/java";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-dexpreopt"
        "soong-genrule"
        "soong-java-config"
        "soong-tradefed"
    ];
    srcs = [
        "java/aapt2.go"
        "java/aar.go"
        "java/android_manifest.go"
        "java/android_resources.go"
        "java/androidmk.go"
        "java/app_builder.go"
        "java/app.go"
        "java/builder.go"
        "java/device_host_converter.go"
        "java/dex.go"
        "java/dexpreopt.go"
        "java/dexpreopt_bootjars.go"
        "java/dexpreopt_config.go"
        "java/droiddoc.go"
        "java/gen.go"
        "java/genrule.go"
        "java/hiddenapi.go"
        "java/hiddenapi_singleton.go"
        "java/jacoco.go"
        "java/java.go"
        "java/jdeps.go"
        "java/java_resources.go"
        "java/kotlin.go"
        "java/plugin.go"
        "java/prebuilt_apis.go"
        "java/proto.go"
        "java/sdk.go"
        "java/sdk_library.go"
        "java/support_libraries.go"
        "java/system_modules.go"
        "java/testing.go"
    ];
    testSrcs = [
        "java/app_test.go"
        "java/device_host_converter_test.go"
        "java/dexpreopt_test.go"
        "java/dexpreopt_bootjars_test.go"
        "java/java_test.go"
        "java/jdeps_test.go"
        "java/kotlin_test.go"
        "java/plugin_test.go"
        "java/sdk_test.go"
    ];
    pluginFor = ["soong_build"];
};

soong-java-config = bootstrap_go_package {
    name = "soong-java-config";
    pkgPath = "android/soong/java/config";
    deps = [
        "blueprint-proptools"
        "soong-android"
    ];
    srcs = [
        "java/config/config.go"
        "java/config/error_prone.go"
        "java/config/kotlin.go"
        "java/config/makevars.go"
    ];
};

soong-python = bootstrap_go_package {
    name = "soong-python";
    pkgPath = "android/soong/python";
    deps = [
        "blueprint"
        "soong-android"
        "soong-tradefed"
    ];
    srcs = [
        "python/androidmk.go"
        "python/binary.go"
        "python/builder.go"
        "python/defaults.go"
        "python/installer.go"
        "python/library.go"
        "python/proto.go"
        "python/python.go"
        "python/test.go"
    ];
    testSrcs = [
        "python/python_test.go"
    ];
    pluginFor = ["soong_build"];
};

soong-shared = bootstrap_go_package {
    name = "soong-shared";
    pkgPath = "android/soong/shared";
    srcs = [
        "shared/paths.go"
    ];
};

soong-tradefed = bootstrap_go_package {
    name = "soong-tradefed";
    pkgPath = "android/soong/tradefed";
    deps = [
        "blueprint"
        "soong-android"
    ];
    srcs = [
        "tradefed/autogen.go"
        "tradefed/config.go"
        "tradefed/makevars.go"
    ];
    pluginFor = ["soong_build"];
};

soong-xml = bootstrap_go_package {
    name = "soong-xml";
    pkgPath = "android/soong/xml";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
    ];
    srcs = [
        "xml/xml.go"
    ];
    testSrcs = [
        "xml/xml_test.go"
    ];
    pluginFor = ["soong_build"];
};

soong-apex = bootstrap_go_package {
    name = "soong-apex";
    pkgPath = "android/soong/apex";
    deps = [
        "blueprint"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-java"
        "soong-python"
    ];
    srcs = [
        "apex/apex.go"
        "apex/key.go"
    ];
    testSrcs = [
        "apex/apex_test.go"
    ];
    pluginFor = ["soong_build"];
};

soong-sysprop = bootstrap_go_package {
    name = "soong-sysprop";
    pkgPath = "android/soong/sysprop";
    deps = [
        "blueprint"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-java"
    ];
    srcs = [
        "sysprop/sysprop_library.go"
    ];
    testSrcs = [
        "sysprop/sysprop_test.go"
    ];
    pluginFor = ["soong_build"];
};

#
#  Defaults to enable various configurations of host bionic
#

linux_bionic_supported = cc_defaults {
    name = "linux_bionic_supported";
    host_supported = true;
    target = {
        host = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
    };
};

#
#  C static libraries extracted from the gcc toolchain
#

libatomic = toolchain_library {
    name = "libatomic";
    defaults = ["linux_bionic_supported"];
    vendor_available = true;
    recovery_available = true;

    arch = {
        arm = {
            src = "prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/arm-linux-androideabi/lib/libatomic.a";
        };
        arm64 = {
            src = "prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/aarch64-linux-android/lib64/libatomic.a";
        };
        x86 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/lib/libatomic.a";
        };
        x86_64 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/x86_64-linux-android/lib64/libatomic.a";
        };
    };
};

libgcc = toolchain_library {
    name = "libgcc";
    defaults = ["linux_bionic_supported"];
    vendor_available = true;
    recovery_available = true;

    arch = {
        arm = {
            src = "prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a";
        };
        arm64 = {
            src = "prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/libgcc.a";
        };
        x86 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/32/libgcc.a";
        };
        x86_64 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/libgcc.a";
        };
    };
};

libgcc_stripped = toolchain_library {
    name = "libgcc_stripped";
    defaults = ["linux_bionic_supported"];
    vendor_available = true;
    recovery_available = true;

    arch = {
        arm = {
            src = "prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a";
            strip = {
                keep_symbols_list = [
                    #  unwind-arm.o
                    "_Unwind_Complete"
                    "_Unwind_DeleteException"
                    "_Unwind_GetCFA"
                    "_Unwind_VRS_Get"
                    "_Unwind_VRS_Pop"
                    "_Unwind_VRS_Set"
                    "__aeabi_unwind_cpp_pr0"
                    "__aeabi_unwind_cpp_pr1"
                    "__aeabi_unwind_cpp_pr2"
                    "__gnu_Unwind_Backtrace"
                    "__gnu_Unwind_ForcedUnwind"
                    "__gnu_Unwind_RaiseException"
                    "__gnu_Unwind_Resume"
                    "__gnu_Unwind_Resume_or_Rethrow"

                    #  libunwind.o
                    "_Unwind_Backtrace"
                    "_Unwind_ForcedUnwind"
                    "_Unwind_RaiseException"
                    "_Unwind_Resume"
                    "_Unwind_Resume_or_Rethrow"
                    "___Unwind_Backtrace"
                    "___Unwind_ForcedUnwind"
                    "___Unwind_RaiseException"
                    "___Unwind_Resume"
                    "___Unwind_Resume_or_Rethrow"
                    "__gnu_Unwind_Restore_VFP"
                    "__gnu_Unwind_Restore_VFP_D"
                    "__gnu_Unwind_Restore_VFP_D_16_to_31"
                    "__gnu_Unwind_Restore_WMMXC"
                    "__gnu_Unwind_Restore_WMMXD"
                    "__gnu_Unwind_Save_VFP"
                    "__gnu_Unwind_Save_VFP_D"
                    "__gnu_Unwind_Save_VFP_D_16_to_31"
                    "__gnu_Unwind_Save_WMMXC"
                    "__gnu_Unwind_Save_WMMXD"
                    "__restore_core_regs"
                    "restore_core_regs"

                    #  pr-support.o
                    "_Unwind_GetDataRelBase"
                    "_Unwind_GetLanguageSpecificData"
                    "_Unwind_GetRegionStart"
                    "_Unwind_GetTextRelBase"
                    "__gnu_unwind_execute"
                    "__gnu_unwind_frame"
                ];
                use_gnu_strip = true;
            };
        };
        arm64 = {
            src = "prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/libgcc.a";
        };
        x86 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/32/libgcc.a";

        };
        x86_64 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/libgcc.a";
        };
    };
    strip = {
        keep_symbols_list = [
            #  unwind-dw2.o
            "_Unwind_Backtrace"
            "_Unwind_DeleteException"
            "_Unwind_FindEnclosingFunction"
            "_Unwind_ForcedUnwind"
            "_Unwind_GetCFA"
            "_Unwind_GetDataRelBase"
            "_Unwind_GetGR"
            "_Unwind_GetIP"
            "_Unwind_GetIPInfo"
            "_Unwind_GetLanguageSpecificData"
            "_Unwind_GetRegionStart"
            "_Unwind_GetTextRelBase"
            "_Unwind_RaiseException"
            "_Unwind_Resume"
            "_Unwind_Resume_or_Rethrow"
            "_Unwind_SetGR"
            "_Unwind_SetIP"
            "__frame_state_for"

            #  unwind-dw2-fde-dip.o
            "_Unwind_Find_FDE"
            "__deregister_frame"
            "__deregister_frame_info"
            "__deregister_frame_info_bases"
            "__register_frame"
            "__register_frame_info"
            "__register_frame_info_bases"
            "__register_frame_info_table"
            "__register_frame_info_table_bases"
            "__register_frame_table"
        ];
        use_gnu_strip = true;
    };
};

libwinpthread = toolchain_library {
    name = "libwinpthread";
    host_supported = true;
    enabled = false;
    target = {
        windows = {
            enabled = true;
        };
        windows_x86 = {
            src = "prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/x86_64-w64-mingw32/lib32/libwinpthread.a";
        };
        windows_x86_64 = {
            src = "prebuilts/gcc/linux-x86/host/x86_64-w64-mingw32-4.8/x86_64-w64-mingw32/lib/libwinpthread.a";
        };
    };
    notice = ":mingw-libwinpthread-notice";
};

libgcov = toolchain_library {
    name = "libgcov";
    defaults = ["linux_bionic_supported"];

    arch = {
        arm = {
            src = "prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/libgcov.a";
        };
        arm64 = {
            src = "prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/libgcov.a";
        };
        x86 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/32/libgcov.a";
        };
        x86_64 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/libgcov.a";
        };
    };
};

device_kernel_headers = kernel_headers {
    name = "device_kernel_headers";
    vendor = true;
    recovery_available = true;
};

host_bionic_linker_asm = cc_genrule {
    name = "host_bionic_linker_asm";
    host_supported = true;
    device_supported = false;
    target = {
        linux_bionic = {
            enabled = true;
        };
        linux_glibc = {
            enabled = false;
        };
        darwin = {
            enabled = false;
        };
    };
    tools = ["extract_linker"];
    cmd = "$(location) -s $(out) $(in)";
    srcs = [":linker"];
    out = ["linker.s"];
};

host_bionic_linker_flags = cc_genrule {
    name = "host_bionic_linker_flags";
    host_supported = true;
    device_supported = false;
    target = {
        linux_bionic = {
            enabled = true;
        };
        linux_glibc = {
            enabled = false;
        };
        darwin = {
            enabled = false;
        };
    };
    tools = ["extract_linker"];
    cmd = "$(location) -f $(out) $(in)";
    srcs = [":linker"];
    out = ["linker.flags"];
};

in { inherit device_kernel_headers host_bionic_linker_asm host_bionic_linker_flags libatomic libgcc libgcc_stripped libgcov libwinpthread linux_bionic_supported soong soong-android soong-apex soong-cc soong-cc-config soong-env soong-genrule soong-java soong-java-config soong-phony soong-python soong-shared soong-sysprop soong-tradefed soong-xml; }

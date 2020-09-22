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
    ramdisk_available = true;
    recovery_available = true;
    native_bridge_supported = true;

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
    native_bridge_supported = true;

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
    ramdisk_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    sdk_version = "current";

    arch = {
        arm = {
            src = "prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/lib/gcc/arm-linux-androideabi/4.9.x/libgcc.a";
            repack_objects_to_keep = [
                "unwind-arm.o"
                "libunwind.o"
                "pr-support.o"
            ];
        };
        arm64 = {
            src = "prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/lib/gcc/aarch64-linux-android/4.9.x/libgcc.a";
            repack_objects_to_keep = [
                "unwind-dw2.o"
                "unwind-dw2-fde-dip.o"
            ];
        };
        x86 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/32/libgcc.a";
            repack_objects_to_keep = [
                "unwind-dw2.o"
                "unwind-dw2-fde-dip.o"
            ];
        };
        x86_64 = {
            src = "prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9/lib/gcc/x86_64-linux-android/4.9.x/libgcc.a";
            repack_objects_to_keep = [
                "unwind-dw2.o"
                "unwind-dw2-fde-dip.o"
            ];
        };
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

in { inherit device_kernel_headers host_bionic_linker_asm host_bionic_linker_flags libatomic libgcc libgcc_stripped libgcov libwinpthread linux_bionic_supported soong; }

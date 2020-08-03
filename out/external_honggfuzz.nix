{ cc_binary, cc_defaults, cc_library, cc_library_headers }:
let

subdirs = [
    "third_party/android/libBlocksRuntime"
];

honggfuzz-defaults = cc_defaults {
    name = "honggfuzz-defaults";
    cflags = [
        "-D_GNU_SOURCE"
        "-fblocks"
        "-Wall"
        "-Wno-initializer-overrides"
        "-Werror"
        "-Wframe-larger-than=131072"
        "-D__HF_USES_CAPSTONE__"
        "-D_HF_ARCH_LINUX"
    ];
    c_std = "c11";
    clang = true;
};

honggfuzz_libcommon_headers = cc_library_headers {
    name = "honggfuzz_libcommon_headers";
    export_include_dirs = ["libhfcommon"];
};

honggfuzz_libcommon = cc_library {
    name = "honggfuzz_libcommon";

    defaults = ["honggfuzz-defaults"];

    header_libs = ["honggfuzz_libcommon_headers"];
    export_header_lib_headers = ["honggfuzz_libcommon_headers"];
    srcs = [
        "libhfcommon/*.c"
    ];

    static_libs = [
        "libBlocksRuntime" #  -fblocks
    ];
};

honggfuzz_libhfuzz_headers = cc_library_headers {
    name = "honggfuzz_libhfuzz_headers";
    export_include_dirs = ["libhfuzz"];
};

honggfuzz_libhfuzz = cc_library {
    name = "honggfuzz_libhfuzz";
    defaults = ["honggfuzz-defaults"];

    arch = {
        x86 = {
            cflags = [
                #  Suppress this performance warning for 32-bit x86.
                "-Wno-atomic-alignment"
            ];
        };
    };

    header_libs = ["honggfuzz_libhfuzz_headers"];
    export_header_lib_headers = ["honggfuzz_libhfuzz_headers"];

    whole_static_libs = [
        "honggfuzz_libcommon"
        "libBlocksRuntime" #  -fblocks
    ];

    srcs = [
        "libhfuzz/*.c"
    ];
};

honggfuzz = cc_binary {
    name = "honggfuzz";
    defaults = ["honggfuzz-defaults"];

    arch = {
        x86 = {
            cflags = [
                #  Suppress this performance warning for 32-bit x86.
                "-Wno-atomic-alignment"
            ];
        };
    };

    whole_static_libs = [
        "honggfuzz_libcommon"
        "libcapstone"
        "libBlocksRuntime" #  -fblocks

        "libunwind_static"
        "liblzma" #  needed for libunwind
    ];

    srcs = [
        "*.c"
        "linux/*.c"
    ];
    exclude_srcs = [
        "linux/bfd.c"
    ];
};

in { inherit honggfuzz honggfuzz-defaults honggfuzz_libcommon honggfuzz_libcommon_headers honggfuzz_libhfuzz honggfuzz_libhfuzz_headers; }

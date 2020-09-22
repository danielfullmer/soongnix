{ cc_defaults, cc_library }:
let

#  Copyright 2015 The Android Open Source Project

libfec_default = cc_defaults {
    name = "libfec_default";

    cflags = [
        "-Wall"
        "-Werror"
        "-O3"
        "-D_LARGEFILE64_SOURCE"
    ];

    srcs = [
        "fec_open.cpp"
        "fec_read.cpp"
        "fec_verity.cpp"
        "fec_process.cpp"
    ];

    export_include_dirs = ["include"];
    #  Exported header include/fec/io.h includes crypto_utils headers.
    export_shared_lib_headers = ["libcrypto_utils"];

    shared_libs = [
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "libcutils"
        "libext4_utils"
        "libsquashfs_utils"
    ];

    static_libs = [
        "libfec_rs"
    ];

    target = {
        host = {
            cflags = [
                "-D_GNU_SOURCE"
                "-DFEC_NO_KLOG"
            ];
        };
        linux_glibc = {
            sanitize = {
                misc_undefined = ["integer"];
            };
        };
    };
};

libfec = cc_library {
    name = "libfec";
    defaults = ["libfec_default"];
    host_supported = true;
    recovery_available = true;

    target = {
        linux = {
            srcs = [
                "avb_utils.cpp"
            ];
            static_libs = [
                "libavb"
            ];
        };

        #  libavb isn't available on mac.
        darwin = {
            srcs = [
                "avb_utils_stub.cpp"
            ];
        };
    };
};

in { inherit libfec libfec_default; }

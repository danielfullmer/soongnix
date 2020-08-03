{ cc_library }:
let

#  Copyright 2015 The Android Open Source Project

libfec = cc_library {
    name = "libfec";
    host_supported = true;
    recovery_available = true;
    srcs = [
        "fec_open.cpp"
        "fec_read.cpp"
        "fec_verity.cpp"
        "fec_process.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-O3"
        "-D_LARGEFILE64_SOURCE"
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

in { inherit libfec; }

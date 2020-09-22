{ cc_binary_host }:
let

fec = cc_binary_host {
    name = "fec";

    target = {
        linux_glibc = {
            sanitize = {
                misc_undefined = ["integer"];
            };
        };
        linux = {
            static_libs = [
                "libavb"
            ];
        };
    };

    srcs = [
        "main.cpp"
        "image.cpp"
    ];

    static_libs = [
        "libbase"
        "libsparse"
        "libz"
        "libcrypto_utils"
        "libcrypto"
        "libfec"
        "libfec_rs"
        "libext4_utils"
        "liblog"
        "libsquashfs_utils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-O3"
    ];
};

in { inherit fec; }

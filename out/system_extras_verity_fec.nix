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
    };

    srcs = [
        "main.cpp"
        "image.cpp"
    ];

    static_libs = [
        "libsparse"
        "libz"
        "libcrypto_utils"
        "libcrypto"
        "libfec"
        "libfec_rs"
        "libext4_utils"
        "libsquashfs_utils"
    ];
    shared_libs = ["libbase"];
    cflags = [
        "-Wall"
        "-Werror"
        "-O3"
    ];
};

in { inherit fec; }

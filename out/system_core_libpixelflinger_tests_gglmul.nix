{ cc_test }:
let

test-pixelflinger-gglmul = cc_test {
    name = "test-pixelflinger-gglmul";

    srcs = ["gglmul_test.cpp"];

    header_libs = ["libpixelflinger_internal"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit test-pixelflinger-gglmul; }

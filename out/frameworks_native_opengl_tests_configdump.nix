{ cc_test }:
let

test-opengl-configdump = cc_test {
    name = "test-opengl-configdump";

    gtest = false;

    srcs = ["configdump.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "libEGL"
        "libGLESv1_CM"
    ];
};

in { inherit test-opengl-configdump; }

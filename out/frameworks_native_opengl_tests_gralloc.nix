{ cc_test }:
let

test-opengl-gralloc = cc_test {
    name = "test-opengl-gralloc";

    srcs = ["gralloc.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    gtest = false;

    shared_libs = [
        "libcutils"
        "libutils"
        "libui"
    ];
};

in { inherit test-opengl-gralloc; }

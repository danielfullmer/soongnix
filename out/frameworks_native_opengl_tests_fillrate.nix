{ cc_test }:
let

test-opengl-fillrate = cc_test {
    name = "test-opengl-fillrate";

    srcs = ["fillrate.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    gtest = false;

    shared_libs = [
        "libcutils"
        "libutils"
        "libEGL"
        "libGLESv1_CM"
        "libui"
        "libgui"
    ];

    static_libs = ["libglTest"];
};

in { inherit test-opengl-fillrate; }

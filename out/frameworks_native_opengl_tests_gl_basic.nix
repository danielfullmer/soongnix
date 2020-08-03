{ cc_test }:
let

test-opengl-gl_basic = cc_test {
    name = "test-opengl-gl_basic";

    srcs = ["gl_basic.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    gtest = false;

    shared_libs = [
        "libcutils"
        "libEGL"
        "libGLESv1_CM"
        "libui"
        "libgui"
        "libutils"
    ];

    static_libs = ["libglTest"];
};

in { inherit test-opengl-gl_basic; }

{ cc_test }:
let

test-opengl-finish = cc_test {
    name = "test-opengl-finish";

    srcs = ["finish.cpp"];

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

    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-Wall"
        "-Werror"
    ];

};

in { inherit test-opengl-finish; }

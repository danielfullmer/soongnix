{ cc_test }:
let

test-opengl-filter = cc_test {
    name = "test-opengl-filter";

    srcs = ["filter.cpp"];

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

    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-Wall"
        "-Werror"
    ];

};

in { inherit test-opengl-filter; }

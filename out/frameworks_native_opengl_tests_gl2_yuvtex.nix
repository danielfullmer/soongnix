{ cc_test }:
let

test-opengl-gl2_yuvtex = cc_test {
    name = "test-opengl-gl2_yuvtex";

    srcs = ["gl2_yuvtex.cpp"];

    shared_libs = [
        "libcutils"
        "libEGL"
        "libGLESv2"
        "libutils"
        "libui"
        "libgui"
        "libutils"
    ];

    gtest = false;

    static_libs = ["libglTest"];

    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-Wall"
        "-Werror"
    ];
};

in { inherit test-opengl-gl2_yuvtex; }

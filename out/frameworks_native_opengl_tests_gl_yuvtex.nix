{ cc_test }:
let

test-opengl-gl_yuvtex = cc_test {
    name = "test-opengl-gl_yuvtex";

    srcs = ["gl_yuvtex.cpp"];

    shared_libs = [
        "libcutils"
        "libEGL"
        "libGLESv1_CM"
        "libutils"
        "libui"
        "libgui"
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

in { inherit test-opengl-gl_yuvtex; }

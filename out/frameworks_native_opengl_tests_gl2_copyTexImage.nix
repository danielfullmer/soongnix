{ cc_test }:
let

test-opengl-gl2_copyTexImage = cc_test {
    name = "test-opengl-gl2_copyTexImage";

    srcs = ["gl2_copyTexImage.cpp"];

    gtest = false;

    shared_libs = [
        "libcutils"
        "libEGL"
        "libGLESv2"
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

in { inherit test-opengl-gl2_copyTexImage; }

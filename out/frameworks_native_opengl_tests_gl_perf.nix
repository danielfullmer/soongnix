{ cc_test }:
let

test-opengl-gl2_perf = cc_test {
    name = "test-opengl-gl2_perf";

    srcs = [
        "gl2_perf.cpp"
        "filltest.cpp"
    ];

    gtest = false;

    shared_libs = [
        "libcutils"
        "liblog"
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

in { inherit test-opengl-gl2_perf; }

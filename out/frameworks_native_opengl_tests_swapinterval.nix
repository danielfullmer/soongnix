{ cc_binary }:
let

test-opengl-swapinterval = cc_binary {
    name = "test-opengl-swapinterval";
    srcs = ["swapinterval.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
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

in { inherit test-opengl-swapinterval; }

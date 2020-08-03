{ cc_binary }:
let

test-opengl-tritex = cc_binary {
    name = "test-opengl-tritex";
    srcs = ["tritex.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
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

in { inherit test-opengl-tritex; }

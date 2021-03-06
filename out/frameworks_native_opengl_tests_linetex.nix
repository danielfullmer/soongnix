{ cc_binary }:
let

test-opengl-linetex = cc_binary {
    name = "test-opengl-linetex";
    srcs = ["linetex.cpp"];
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

in { inherit test-opengl-linetex; }

{ cc_binary }:
let

test-opengl-textures = cc_binary {
    name = "test-opengl-textures";
    srcs = ["textures.cpp"];
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

in { inherit test-opengl-textures; }

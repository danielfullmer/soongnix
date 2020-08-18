{ cc_binary, cc_library_static }:
let

libcnativewindow = cc_library_static {
    name = "libcnativewindow";
    srcs = [
        "cnativewindow.c"
        "util.c"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    shared_libs = [
        "libEGL"
        "libGLESv2"
        "libdl"
        "libhardware"
        "libnativewindow"
    ];
};

hwc-test-arrows = cc_binary {
    name = "hwc-test-arrows";
    srcs = ["test-arrows.c"];
    static_libs = ["libcnativewindow"];
    shared_libs = [
        "libEGL"
        "libGLESv2"
        "libdl"
        "libhardware"
        "libnativewindow"
    ];
    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-Wall"
        "-Werror"
    ];
};

in { inherit hwc-test-arrows libcnativewindow; }

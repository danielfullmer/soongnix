{ cc_binary, cc_defaults, cc_library_shared }:
let

bootanimation_defaults = cc_defaults {
    name = "bootanimation_defaults";

    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"

        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];

    shared_libs = [
        "libandroidfw"
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];
};

#  bootanimation executable
#  =========================================================

bootanimation = cc_binary {
    name = "bootanimation";
    defaults = ["bootanimation_defaults"];

    shared_libs = [
        "libOpenSLES"
        "libbootanimation"
    ];

    srcs = [
        "BootAnimationUtil.cpp"

        "bootanimation_main.cpp"
        "audioplay.cpp"
    ];

    init_rc = ["bootanim.rc"];

    cflags = [
        "-Wno-deprecated-declarations"
    ];
};

#  libbootanimation
#  ===========================================================

libbootanimation = cc_library_shared {
    name = "libbootanimation";
    defaults = ["bootanimation_defaults"];

    srcs = ["BootAnimation.cpp"];

    shared_libs = [
        "libui"
        "libhwui"
        "libEGL"
        "libGLESv1_CM"
        "libgui"
    ];
};

in { inherit bootanimation bootanimation_defaults libbootanimation; }

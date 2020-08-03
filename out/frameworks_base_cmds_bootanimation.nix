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

    product_variables = {
        product_is_iot = {
            shared_libs = [
                "libandroidthings"
                "libandroidthings_protos"
                "libchrome"
                "libprotobuf-cpp-lite"
            ];
            static_libs = ["libjsoncpp"];
            srcs = [
                "iot/iotbootanimation_main.cpp"
                "iot/BootAction.cpp"
                "iot/BootParameters.cpp"
            ];
            exclude_srcs = [
                "bootanimation_main.cpp"
                "audioplay.cpp"
            ];
        };
    };

    init_rc = ["bootanim.rc"];
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
        "libtinyalsa"
    ];

    product_variables = {
        product_is_iot = {
            init_rc = ["iot/bootanim_iot.rc"];
        };
    };
};

in { inherit bootanimation bootanimation_defaults libbootanimation; }

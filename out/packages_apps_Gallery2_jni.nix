{ cc_defaults, cc_library_shared }:
let

gallery2_jni_defaults = cc_defaults {
    name = "gallery2_jni_defaults";
    product_specific = true;

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"

        #  to fix implicit conversion from 'int' to 'char', (255 to -1, 128 to -128)
        "-Wno-error=constant-conversion"

        "-Wno-unused-parameter"
    ];
    sdk_version = "9";
    shared_libs = ["liblog"];
};

libjni_eglfence = cc_library_shared {
    name = "libjni_eglfence";
    defaults = ["gallery2_jni_defaults"];

    cflags = ["-DEGL_EGLEXT_PROTOTYPES"];
    shared_libs = ["libEGL"];
    srcs = ["jni_egl_fence.cpp"];
};

#  Filtershow
libjni_filtershow_filters = cc_library_shared {
    name = "libjni_filtershow_filters";
    defaults = ["gallery2_jni_defaults"];

    srcs = [
        "filters/gradient.c"
        "filters/saturated.c"
        "filters/exposure.c"
        "filters/edge.c"
        "filters/contrast.c"
        "filters/hue.c"
        "filters/shadows.c"
        "filters/highlight.c"
        "filters/hsv.c"
        "filters/vibrance.c"
        "filters/geometry.c"
        "filters/negative.c"
        "filters/redEyeMath.c"
        "filters/fx.c"
        "filters/wbalance.c"
        "filters/redeye.c"
        "filters/bwfilter.c"
        "filters/tinyplanet.cc"
        "filters/kmeans.cc"
    ];

    cflags = [
        "-ffast-math"
        "-O3"
        "-funroll-loops"
    ];
    shared_libs = ["libjnigraphics"];
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

in { inherit gallery2_jni_defaults libjni_eglfence libjni_filtershow_filters; }

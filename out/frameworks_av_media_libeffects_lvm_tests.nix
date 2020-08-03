{ cc_test }:
let

#  Build the unit tests for effects

lvmtest = cc_test {
    name = "lvmtest";
    host_supported = false;
    proprietary = true;

    include_dirs = [
        "frameworks/av/media/libeffects/lvm/lib/Bass/lib"
        "frameworks/av/media/libeffects/lvm/lib/Bass/src"
        "frameworks/av/media/libeffects/lvm/lib/Bundle/src"
        "frameworks/av/media/libeffects/lvm/lib/Common/src"
        "frameworks/av/media/libeffects/lvm/lib/Eq/lib"
        "frameworks/av/media/libeffects/lvm/lib/Eq/src"
        "frameworks/av/media/libeffects/lvm/lib/SpectrumAnalyzer/lib"
        "frameworks/av/media/libeffects/lvm/lib/SpectrumAnalyzer/src"
        "frameworks/av/media/libeffects/lvm/lib/StereoWidening/lib"
        "frameworks/av/media/libeffects/lvm/lib/StereoWidening/src"
        "frameworks/av/media/libeffects/lvm/wrapper/Bundle"
    ];

    header_libs = [
        "libaudioeffects"
    ];

    shared_libs = [
        "libaudioutils"
        "liblog"
    ];

    static_libs = [
        "libmusicbundle"
    ];

    srcs = ["lvmtest.cpp"];

    cflags = [
        "-DBUILD_FLOAT"
        "-DHIGHER_FS"
        "-DSUPPORT_MC"

        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

snr = cc_test {
    name = "snr";
    host_supported = false;

    srcs = ["snr.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

in { inherit lvmtest snr; }

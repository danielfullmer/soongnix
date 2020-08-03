{ cc_test }:
let

#  Build the unit tests.

MediaCodecListOverrides_test = cc_test {
    name = "MediaCodecListOverrides_test";

    srcs = ["MediaCodecListOverrides_test.cpp"];

    shared_libs = [
        "libmedia"
        "libstagefright"
        "libstagefright_foundation"
        "libstagefright_omx"
        "libutils"
        "liblog"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/av/media/libstagefright/include"
        "frameworks/native/include/media/openmax"
    ];

    compile_multilib = "32";

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

BatteryChecker_test = cc_test {
    name = "BatteryChecker_test";
    srcs = ["BatteryChecker_test.cpp"];
    test_suites = ["device-tests"];

    shared_libs = [
        "libstagefright"
        "libstagefright_foundation"
        "libutils"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit BatteryChecker_test MediaCodecListOverrides_test; }

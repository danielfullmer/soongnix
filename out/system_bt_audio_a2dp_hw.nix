{ cc_defaults, cc_library, cc_library_static, cc_test }:
let

audio_a2dp_hw_defaults = cc_defaults {
    name = "audio_a2dp_hw_defaults";
    defaults = ["fluoride_defaults"];
    include_dirs = [
        "system/bt"
        "system/bt/include"
        "system/bt/audio_a2dp_hw/include"
    ];
};

#  Audio A2DP shared library for target
#  ========================================================
"audio.a2dp.default" = cc_library {
    name = "audio.a2dp.default";
    defaults = ["audio_a2dp_hw_defaults"];
    relative_install_path = "hw";
    srcs = [
        "src/audio_a2dp_hw.cc"
        "src/audio_a2dp_hw_utils.cc"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
    ];
    static_libs = ["libosi"];
};

libaudio-a2dp-hw-utils = cc_library_static {
    name = "libaudio-a2dp-hw-utils";
    defaults = ["audio_a2dp_hw_defaults"];
    srcs = [
        "src/audio_a2dp_hw_utils.cc"
    ];
};

#  Audio A2DP library unit tests for target and host
#  ========================================================
net_test_audio_a2dp_hw = cc_test {
    name = "net_test_audio_a2dp_hw";
    test_suites = ["device-tests"];
    defaults = ["audio_a2dp_hw_defaults"];
    srcs = [
        "test/audio_a2dp_hw_test.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "audio.a2dp.default"
        "libosi"
    ];
};

in { inherit "audio.a2dp.default" audio_a2dp_hw_defaults libaudio-a2dp-hw-utils net_test_audio_a2dp_hw; }

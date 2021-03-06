{ cc_defaults, cc_library, cc_library_static, cc_test }:
let

audio_hearing_aid_hw_defaults = cc_defaults {
    name = "audio_hearing_aid_hw_defaults";
    defaults = ["fluoride_defaults"];
    include_dirs = [
        "system/bt"
        "system/bt/include"
        "system/bt/audio_hearing_aid_hw/include"
    ];
};

#  Audio A2DP shared library for target
#  ========================================================
"audio.hearing_aid.default" = cc_library {
    name = "audio.hearing_aid.default";
    defaults = ["audio_hearing_aid_hw_defaults"];
    relative_install_path = "hw";
    srcs = [
        "src/audio_hearing_aid_hw.cc"
        "src/audio_hearing_aid_hw_utils.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = ["libosi"];
};

libaudio-hearing-aid-hw-utils = cc_library_static {
    name = "libaudio-hearing-aid-hw-utils";
    defaults = ["audio_hearing_aid_hw_defaults"];
    srcs = [
        "src/audio_hearing_aid_hw_utils.cc"
    ];
};

#  Audio A2DP library unit tests for target and host
#  ========================================================
net_test_audio_hearing_aid_hw = cc_test {
    name = "net_test_audio_hearing_aid_hw";
    test_suites = ["device-tests"];
    defaults = ["audio_hearing_aid_hw_defaults"];
    srcs = [
        "test/audio_hearing_aid_hw_test.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "audio.hearing_aid.default"
        "libosi"
    ];
};

in { inherit "audio.hearing_aid.default" audio_hearing_aid_hw_defaults libaudio-hearing-aid-hw-utils net_test_audio_hearing_aid_hw; }

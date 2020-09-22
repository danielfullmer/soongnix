{ cc_test }:
let

VtsHalVibratorTargetTest = cc_test {
    name = "VtsHalVibratorTargetTest";
    defaults = [
        "VtsHalTargetTestDefaults"
        "use_libaidlvintf_gtest_helper_static"
    ];
    srcs = ["VtsHalVibratorTargetTest.cpp"];
    shared_libs = [
        "libbinder"
    ];
    static_libs = [
        "android.hardware.vibrator-cpp"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalVibratorTargetTest; }

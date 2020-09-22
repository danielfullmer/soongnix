{ cc_test }:
let

audiofoundation_parcelable_test = cc_test {
    name = "audiofoundation_parcelable_test";

    shared_libs = [
        "libaudiofoundation"
        "libbinder"
        "liblog"
        "libutils"
    ];

    header_libs = [
        "libaudio_system_headers"
    ];

    srcs = [
        "audiofoundation_parcelable_test.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    test_suites = ["device-tests"];
};

in { inherit audiofoundation_parcelable_test; }

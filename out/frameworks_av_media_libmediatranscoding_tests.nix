{ cc_defaults, cc_test }:
let

#  Build the unit tests for libmediatranscoding.
libmediatranscoding_test_defaults = cc_defaults {
    name = "libmediatranscoding_test_defaults";

    header_libs = [
        "libbase_headers"
        "libmedia_headers"
    ];

    shared_libs = [
        "libbinder_ndk"
        "libcutils"
        "liblog"
        "libutils"
        "libmediatranscoding"
    ];

    static_libs = [
        "mediatranscoding_aidl_interface-ndk_platform"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    test_suites = ["device-tests"];
};

#
#  TranscodingClientManager unit test
#
TranscodingClientManager_tests = cc_test {
    name = "TranscodingClientManager_tests";
    defaults = ["libmediatranscoding_test_defaults"];

    srcs = ["TranscodingClientManager_tests.cpp"];
};

#
#  AdjustableMaxPriorityQueue unit test
#
AdjustableMaxPriorityQueue_tests = cc_test {
    name = "AdjustableMaxPriorityQueue_tests";
    defaults = ["libmediatranscoding_test_defaults"];

    srcs = ["AdjustableMaxPriorityQueue_tests.cpp"];
};

in { inherit AdjustableMaxPriorityQueue_tests TranscodingClientManager_tests libmediatranscoding_test_defaults; }

{ cc_defaults, cc_test }:
let

#  Build the unit tests for MediaTranscodingService

mediatranscodingservice_test_defaults = cc_defaults {
    name = "mediatranscodingservice_test_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];

    include_dirs = [
        "frameworks/av/services/mediatranscoding"
    ];

    shared_libs = [
        "libbinder"
        "libbinder_ndk"
        "liblog"
        "libutils"
        "libmediatranscodingservice"
    ];

    static_libs = [
        "mediatranscoding_aidl_interface-ndk_platform"
    ];
};

#  MediaTranscodingService unit test
mediatranscodingservice_tests = cc_test {
    name = "mediatranscodingservice_tests";
    defaults = ["mediatranscodingservice_test_defaults"];

    srcs = ["mediatranscodingservice_tests.cpp"];
};

in { inherit mediatranscodingservice_test_defaults mediatranscodingservice_tests; }

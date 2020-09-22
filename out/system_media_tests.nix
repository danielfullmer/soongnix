{ cc_test }:
let

#  system/audio.h utilities test

systemaudio_tests = cc_test {
    name = "systemaudio_tests";

    shared_libs = [
        "libaudiofoundation"
        "libbase"
        "liblog"
        "libmedia_helper"
        "libutils"
    ];

    header_libs = ["libmedia_headers"];

    srcs = ["systemaudio_tests.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    test_suites = ["device-tests"];

};

in { inherit systemaudio_tests; }

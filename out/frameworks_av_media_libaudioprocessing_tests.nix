{ cc_binary, cc_defaults, cc_test }:
let

#  Build the unit tests for libaudioprocessing

libaudioprocessing_test_defaults = cc_defaults {
    name = "libaudioprocessing_test_defaults";

    header_libs = ["libbase_headers"];
    shared_libs = [
        "libaudioprocessing"
        "libaudioutils"
        "libcutils"
        "liblog"
        "libutils"
        "libvibrator"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

#
#  resampler unit test
#
resampler_tests = cc_test {
    name = "resampler_tests";
    defaults = ["libaudioprocessing_test_defaults"];

    srcs = ["resampler_tests.cpp"];
};

#
#  audio mixer test tool
#
test-mixer = cc_binary {
    name = "test-mixer";
    defaults = ["libaudioprocessing_test_defaults"];

    srcs = ["test-mixer.cpp"];
    static_libs = ["libsndfile"];
};

#
#  build audio resampler test tool
#
test-resampler = cc_binary {
    name = "test-resampler";
    defaults = ["libaudioprocessing_test_defaults"];

    srcs = ["test-resampler.cpp"];
    static_libs = ["libsndfile"];
};

in { inherit libaudioprocessing_test_defaults resampler_tests test-mixer test-resampler; }

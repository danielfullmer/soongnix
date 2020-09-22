{ cc_benchmark, cc_binary, cc_defaults, cc_test }:
let

#  Build the unit tests for libaudioprocessing

libaudioprocessing_test_defaults = cc_defaults {
    name = "libaudioprocessing_test_defaults";

    header_libs = [
        "libbase_headers"
        "libmedia_headers"
    ];

    shared_libs = [
        "libaudioclient"
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

#
#  build mixerops objdump
#
#  This is used to verify proper optimization of the code.
#
#  For example, use:
#  ./prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/aarch64-linux-android-objdump
#       -d --source ./out/target/product/crosshatch/symbols/system/bin/mixerops_objdump
#
mixerops_objdump = cc_binary {
    name = "mixerops_objdump";
    srcs = ["mixerops_objdump.cpp"];
};

#
#  build mixerops benchmark
#
mixerops_benchmark = cc_benchmark {
    name = "mixerops_benchmark";
    srcs = ["mixerops_benchmark.cpp"];
    static_libs = ["libgoogle-benchmark"];
};

in { inherit libaudioprocessing_test_defaults mixerops_benchmark mixerops_objdump resampler_tests test-mixer test-resampler; }

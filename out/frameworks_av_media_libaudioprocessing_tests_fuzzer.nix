{ cc_fuzz }:
let

libaudioprocessing_resampler_fuzzer = cc_fuzz {
    name = "libaudioprocessing_resampler_fuzzer";
    srcs = [
        "libaudioprocessing_resampler_fuzzer.cpp"
    ];
    defaults = ["libaudioprocessing_test_defaults"];
    static_libs = [
        "libsndfile"
    ];
};

in { inherit libaudioprocessing_resampler_fuzzer; }

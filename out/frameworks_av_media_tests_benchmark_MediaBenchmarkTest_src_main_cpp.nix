{ cc_test_library }:
let

libmediabenchmark_jni = cc_test_library {
    name = "libmediabenchmark_jni";
    sdk_version = "current";

    defaults = [
        "libmediabenchmark_common-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = [
        "NativeExtractor.cpp"
        "NativeMuxer.cpp"
        "NativeEncoder.cpp"
        "NativeDecoder.cpp"
    ];

    shared_libs = [
        "liblog"
    ];

    static_libs = [
        "libmediabenchmark_common"
        "libmediabenchmark_extractor"
        "libmediabenchmark_muxer"
        "libmediabenchmark_decoder"
        "libmediabenchmark_encoder"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit libmediabenchmark_jni; }

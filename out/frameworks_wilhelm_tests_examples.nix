{ cc_binary, cc_test }:
let

#  slesTest_recBuffQueue

slesTest_recBuffQueue = cc_test {
    name = "slesTest_recBuffQueue";
    gtest = false;

    srcs = ["slesTestRecBuffQueue.cpp"];

    shared_libs = [
        "libaudioutils"
        "libOpenSLES"
    ];

    static_libs = ["libsndfile"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_playFdPath

slesTest_playFdPath = cc_binary {
    name = "slesTest_playFdPath";

    srcs = ["slesTestPlayFdPath.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];

};

#  slesTest_feedback

slesTest_feedback = cc_test {
    name = "slesTest_feedback";
    gtest = false;

    srcs = ["slesTestFeedback.cpp"];

    shared_libs = [
        "libaudioutils"
        "libOpenSLES"
    ];

    static_libs = ["libsndfile"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_sawtoothBufferQueue

slesTest_sawtoothBufferQueue = cc_test {
    name = "slesTest_sawtoothBufferQueue";
    gtest = false;

    srcs = ["slesTestSawtoothBufferQueue.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_eqFdPath

slesTest_eqFdPath = cc_test {
    name = "slesTest_eqFdPath";
    gtest = false;

    srcs = ["slesTestEqFdPath.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_eqOutputPath

slesTest_eqOutputPath = cc_test {
    name = "slesTest_eqOutputPath";
    gtest = false;

    srcs = ["slesTestEqOutputPath.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_bassboostPath

slesTest_bassboostPath = cc_test {
    name = "slesTest_bassboostPath";
    gtest = false;

    srcs = ["slesTestBassBoostPath.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_virtualizer

slesTest_virtualizer = cc_test {
    name = "slesTest_virtualizer";
    gtest = false;

    srcs = ["slesTestVirtualizerPath.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_effectCapabilities

slesTest_effectCapabilities = cc_test {
    name = "slesTest_effectCapabilities";
    gtest = false;

    srcs = ["slesTestEffectCapabilities.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_sendToPresetReverb

slesTest_sendToPresetReverb = cc_test {
    name = "slesTest_sendToPresetReverb";
    gtest = false;

    srcs = ["slesTestSendToPresetReverb.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_decodeToBuffQueue

slesTest_decodeToBuffQueue = cc_test {
    name = "slesTest_decodeToBuffQueue";
    gtest = false;

    srcs = ["slesTestDecodeToBuffQueue.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

# ##################
#  slesTestDecodeAac

slesTest_decodeAac = cc_test {
    name = "slesTest_decodeAac";
    gtest = false;

    srcs = ["slesTestDecodeAac.cpp"];

    shared_libs = ["libOpenSLES"];

    static_libs = ["libcpustats"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

# ######################################
#  OpenMAX AL example code

#  xaVideoDecoderCapabilities

xaVideoDecoderCapabilities = cc_test {
    name = "xaVideoDecoderCapabilities";
    gtest = false;

    srcs = ["xaVideoDecoderCapabilities.cpp"];

    shared_libs = ["libOpenMAXAL"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit slesTest_bassboostPath slesTest_decodeAac slesTest_decodeToBuffQueue slesTest_effectCapabilities slesTest_eqFdPath slesTest_eqOutputPath slesTest_feedback slesTest_playFdPath slesTest_recBuffQueue slesTest_sawtoothBufferQueue slesTest_sendToPresetReverb slesTest_virtualizer xaVideoDecoderCapabilities; }

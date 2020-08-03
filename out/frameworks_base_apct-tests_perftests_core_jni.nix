{ cc_library_shared }:
let

libperftestscore_jni = cc_library_shared {
    name = "libperftestscore_jni";
    sdk_version = "21";

    srcs = ["SystemPerfTest.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libperftestscore_jni; }

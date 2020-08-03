{ cc_test_library }:
let

libnative-media-jni = cc_test_library {
    name = "libnative-media-jni";
    srcs = ["native-media-jni.c"];
    cflags = [
        "-Werror"
        "-Wall"
        "-UNDEBUG"
        "-Wno-unused-parameter"
    ];
    include_dirs = ["frameworks/wilhelm/include"];
    gtest = false;
    shared_libs = [
        "libutils"
        "liblog"
        "libOpenMAXAL"
        "libandroid"
    ];

};

in { inherit libnative-media-jni; }

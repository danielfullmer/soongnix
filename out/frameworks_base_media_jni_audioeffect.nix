{ cc_library_shared }:
let

libaudioeffect_jni = cc_library_shared {
    name = "libaudioeffect_jni";

    srcs = [
        "android_media_AudioEffect.cpp"
        "android_media_SourceDefaultEffect.cpp"
        "android_media_StreamDefaultEffect.cpp"
        "android_media_Visualizer.cpp"
    ];

    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libandroid_runtime"
        "libnativehelper"
        "libmedia"
        "libaudioclient"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libaudioeffect_jni; }

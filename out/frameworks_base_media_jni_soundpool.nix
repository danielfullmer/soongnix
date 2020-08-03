{ cc_library_shared }:
let

libsoundpool = cc_library_shared {
    name = "libsoundpool";

    srcs = [
        "android_media_SoundPool.cpp"
        "SoundPool.cpp"
        "SoundPoolThread.cpp"
    ];

    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libandroid_runtime"
        "libnativehelper"
        "libaudioclient"
        "libmediandk"
        "libbinder"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libsoundpool; }

{ cc_test }:
let

DrmSessionManager_test = cc_test {

    name = "DrmSessionManager_test";

    srcs = ["DrmSessionManager_test.cpp"];

    shared_libs = [
        "liblog"
        "libmediaplayerservice"
        "libmediadrm"
        "libutils"
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

};

in { inherit DrmSessionManager_test; }

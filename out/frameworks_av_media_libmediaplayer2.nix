{ cc_library, cc_library_headers, cc_library_static }:
let

libmediaplayer2_headers = cc_library_headers {
    name = "libmediaplayer2_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

libmediaplayer2 = cc_library_static {
    name = "libmediaplayer2";

    srcs = [
        "MediaPlayer2AudioOutput.cpp"
        "mediaplayer2.cpp"
    ];

    shared_libs = [
        "libandroid_runtime"
        "libaudioclient"
        "libbinder"
        "libbinder_ndk"
        "libcutils"
        "libgui"
        "liblog"
        "libmedia_omx"
        "libui"
        "libutils"

        "libcrypto"
        "libmediametrics"
        "libmediandk"
        "libmediandk_utils"
        "libmediautils"
        "libmemunreachable"
        "libnativewindow"
        "libpowermanager"
        "libstagefright_httplive"
    ];

    export_shared_lib_headers = [
        "libaudioclient"
        "libbinder"
        "libgui"
        "libmedia_omx"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    include_dirs = [
        "frameworks/base/core/jni"
    ];

    static_libs = [
        "libmedia_helper"
        "libmediaplayer2-protos"
        "libmedia_player2_util"
        "libprotobuf-cpp-lite"
        "libstagefright_foundation_without_imemory"
        "libstagefright_nuplayer2"
        "libstagefright_player2"
        "libstagefright_rtsp"
        "libstagefright_timedtext2"
        "libmedia2_jni_core"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

libmedia2_jni_core = cc_library {
    name = "libmedia2_jni_core";

    srcs = [
        "JavaVMHelper.cpp"
        "JAudioTrack.cpp"
        "JMedia2HTTPService.cpp"
        "JMedia2HTTPConnection.cpp"
    ];

    header_libs = [
        "libbinder_headers"
        "libnativehelper_header_only"
    ];

    shared_libs = [
        "liblog"
        "libutils"
        "libdl"
    ];

    include_dirs = [
        "frameworks/av/media/libmedia/include"
        "frameworks/base/core/jni"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };

};

in { inherit libmedia2_jni_core libmediaplayer2 libmediaplayer2_headers; }

{ cc_library_shared }:
let

libmediaplayerservice = cc_library_shared {

    srcs = [
        "ActivityManager.cpp"
        "DeathNotifier.cpp"
        "MediaPlayerFactory.cpp"
        "MediaPlayerService.cpp"
        "MediaRecorderClient.cpp"
        "MetadataRetrieverClient.cpp"
        "StagefrightRecorder.cpp"
        "TestPlayerStub.cpp"
    ];

    shared_libs = [
        "android.hardware.media.c2@1.0"
        "android.hardware.media.omx@1.0"
        "libbase"
        "libaudioclient"
        "libbinder"
        "libcamera_client"
        "libcodec2_client"
        "libcrypto"
        "libcutils"
        "libdl"
        "libgui"
        "libhidlbase"
        "liblog"
        "libmedia"
        "libmedia_omx"
        "libmediadrm"
        "libmediametrics"
        "libmediautils"
        "libmemunreachable"
        "libnetd_client"
        "libpowermanager"
        "libstagefright"
        "libstagefright_foundation"
        "libstagefright_httplive"
        "libutils"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    static_libs = [
        "libstagefright_nuplayer"
        "libstagefright_rtsp"
        "libstagefright_timedtext"
    ];

    export_shared_lib_headers = ["libmedia"];

    include_dirs = [
        "frameworks/av/media/libstagefright/rtsp"
        "frameworks/av/media/libstagefright/webm"
    ];

    local_include_dirs = ["include"];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    name = "libmediaplayerservice";

    sanitize = {
        cfi = true;
    };

};

in { inherit libmediaplayerservice; }

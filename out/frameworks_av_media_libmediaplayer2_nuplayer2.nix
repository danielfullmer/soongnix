{ cc_library_static }:
let

libstagefright_nuplayer2 = cc_library_static {

    srcs = [
        "JMediaPlayer2Utils.cpp"
        "JWakeLock.cpp"
        "GenericSource2.cpp"
        "HTTPLiveSource2.cpp"
        "NuPlayer2.cpp"
        "NuPlayer2CCDecoder.cpp"
        "NuPlayer2Decoder.cpp"
        "NuPlayer2DecoderBase.cpp"
        "NuPlayer2DecoderPassThrough.cpp"
        "NuPlayer2Driver.cpp"
        "NuPlayer2Drm.cpp"
        "NuPlayer2Renderer.cpp"
        "RTSPSource2.cpp"
    ];

    header_libs = [
        "libbase_headers"
        "libmediaplayer2_headers"
        "media_plugin_headers"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/av/media/libstagefright/httplive"
        "frameworks/av/media/libstagefright/include"
        "frameworks/av/media/libstagefright/mpeg2ts"
        "frameworks/av/media/libstagefright/rtsp"
        "frameworks/av/media/libstagefright/timedtext"
        "frameworks/av/media/ndk"
        "frameworks/base/core/jni"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    product_variables = {
        debuggable = {
            cflags = [
                "-DENABLE_STAGEFRIGHT_EXPERIMENTS"
            ];
        };
    };

    shared_libs = [
        "libbinder"
        "libui"
        "libgui"
        "libmedia"
        "libmediametrics"
        "libmediandk"
        "libmediandk_utils"
        "libpowermanager"
    ];

    static_libs = [
        "libmedia_helper"
        "libmediaplayer2-protos"
        "libmedia2_jni_core"
    ];

    name = "libstagefright_nuplayer2";

    sanitize = {
        cfi = true;
    };

};

in { inherit libstagefright_nuplayer2; }

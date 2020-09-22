{ cc_library_static }:
let

libstagefright_nuplayer = cc_library_static {

    srcs = [
        "AWakeLock.cpp"
        "GenericSource.cpp"
        "HTTPLiveSource.cpp"
        "NuPlayer.cpp"
        "NuPlayerCCDecoder.cpp"
        "NuPlayerDecoder.cpp"
        "NuPlayerDecoderBase.cpp"
        "NuPlayerDecoderPassThrough.cpp"
        "NuPlayerDriver.cpp"
        "NuPlayerDrm.cpp"
        "NuPlayerRenderer.cpp"
        "NuPlayerStreamListener.cpp"
        "RTSPSource.cpp"
        "StreamingSource.cpp"
    ];

    header_libs = [
        "libmediadrm_headers"
        "libmediametrics_headers"
        "media_plugin_headers"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/av/media/libstagefright/httplive"
        "frameworks/av/media/libstagefright/include"
        "frameworks/av/media/libstagefright/mpeg2ts"
        "frameworks/av/media/libstagefright/rtsp"
        "frameworks/av/media/libstagefright/timedtext"
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
        "libdatasource"
        "libui"
        "libgui"
        "libmedia"
        "libmediadrm"
        "libpowermanager"
    ];

    static_libs = [
        "libplayerservice_datasource"
    ];

    name = "libstagefright_nuplayer";

    sanitize = {
        cfi = true;
    };

};

in { inherit libstagefright_nuplayer; }

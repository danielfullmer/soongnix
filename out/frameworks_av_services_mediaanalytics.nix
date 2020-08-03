{ cc_binary }:
let

#  Media Statistics service
#

mediametrics = cc_binary {
    name = "mediametrics";

    srcs = [
        "main_mediametrics.cpp"
        "MediaAnalyticsService.cpp"
        "iface_statsd.cpp"
        "statsd_audiopolicy.cpp"
        "statsd_audiorecord.cpp"
        "statsd_audiothread.cpp"
        "statsd_audiotrack.cpp"
        "statsd_codec.cpp"
        "statsd_drm.cpp"
        "statsd_extractor.cpp"
        "statsd_nuplayer.cpp"
        "statsd_recorder.cpp"
    ];

    proto = {
        type = "lite";
    };

    shared_libs = [
        "libcutils"
        "liblog"
        "libmedia"
        "libutils"
        "libbinder"
        "libdl"
        "libgui"
        "libmedia"
        "libmediautils"
        "libmediametrics"
        "libstagefright_foundation"
        "libstatslog"
        "libutils"
        "libprotobuf-cpp-lite"
    ];

    static_libs = [
        "libplatformprotos"
        "libregistermsext"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
        "frameworks/av/media/libstagefright/rtsp"
        "frameworks/av/media/libstagefright/webm"
        "frameworks/av/include/media"
        "frameworks/av/include/camera"
        "frameworks/native/include/media/openmax"
        "frameworks/native/include/media/hardware"
        "external/tremolo/Tremolo"
    ];

    init_rc = ["mediametrics.rc"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-error=deprecated-declarations"
    ];
    clang = true;

};

in { inherit mediametrics; }

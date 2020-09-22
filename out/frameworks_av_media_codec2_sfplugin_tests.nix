{ cc_test }:
let

ccodec_unit_test = cc_test {
    name = "ccodec_unit_test";

    srcs = [
        "CCodecBuffers_test.cpp"
        "CCodecConfig_test.cpp"
        "ReflectedParamUpdater_test.cpp"
    ];

    defaults = [
        "libcodec2-impl-defaults"
        "libcodec2-internal-defaults"
    ];

    include_dirs = [
        "frameworks/av/media/codec2/sfplugin"
    ];

    shared_libs = [
        "android.hardware.media.bufferpool@2.0"
        "android.hardware.media.c2@1.0"
        "libcodec2"
        "libcodec2_client"
        "libhidlbase"
        "libfmq"
        "libmedia_omx"
        "libsfplugin_ccodec"
        "libsfplugin_ccodec_utils"
        "libstagefright_foundation"
        "libutils"
    ];

    static_libs = [
        "libcodec2_hidl@1.0"
        "libstagefright_bufferpool@2.0"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

mc_sanity_test = cc_test {
    name = "mc_sanity_test";

    srcs = [
        "MediaCodec_sanity_test.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/codec2/sfplugin"
    ];

    header_libs = [
        "libmediadrm_headers"
        "libmediametrics_headers"
    ];

    shared_libs = [
        "libbinder"
        "libcodec2"
        "libgui"
        "libmedia"
        "libmedia_omx"
        "libsfplugin_ccodec"
        "libstagefright"
        "libstagefright_foundation"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit ccodec_unit_test mc_sanity_test; }

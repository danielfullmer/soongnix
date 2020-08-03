{ cc_test }:
let

ccodec_unit_test = cc_test {
    name = "ccodec_unit_test";

    srcs = [
        "ReflectedParamUpdater_test.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/codec2/sfplugin"
    ];

    shared_libs = [
        "libcodec2"
        "libsfplugin_ccodec"
        "libstagefright_foundation"
        "libutils"
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

{ cc_test }:
let

ccodec_test = cc_test {
    name = "ccodec_test";

    srcs = [
        "ReflectedParamUpdater_test.cpp"
    ];

    include_dirs = [
        "hardware/google/av/media/sfplugin"
    ];

    shared_libs = [
        "libstagefright_ccodec"
        "libstagefright_codec2"
        "libstagefright_foundation"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

mc_sanity = cc_test {
    name = "mc_sanity";

    srcs = [
        "MediaCodec_sanity_test.cpp"
    ];

    include_dirs = [
        "hardware/google/av/media/sfplugin"
    ];

    shared_libs = [
        "libbinder"
        "libgui"
        "libmedia"
        "libmedia_omx"
        "libstagefright"
        "libstagefright_ccodec"
        "libstagefright_codec2"
        "libstagefright_foundation"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit ccodec_test mc_sanity; }

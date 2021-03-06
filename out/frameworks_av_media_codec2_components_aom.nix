{ cc_library_shared }:
let

libcodec2_soft_av1dec_aom = cc_library_shared {
    name = "libcodec2_soft_av1dec_aom";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    #  coordinated with frameworks/av/media/codec2/components/gav1/Android.bp
    #  so only 1 of them has the official c2.android.av1.decoder name
    cflags = [
        "-DCODECNAME=\"c2.android.av1-aom.decoder\""
    ];

    srcs = ["C2SoftAomDec.cpp"];
    static_libs = ["libaom"];

    include_dirs = [
        "external/libaom/"
    ];
};

in { inherit libcodec2_soft_av1dec_aom; }

{ cc_library_shared }:
let

libcodec2_soft_av1dec_gav1 = cc_library_shared {
    name = "libcodec2_soft_av1dec_gav1";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    #  coordinated with frameworks/av/media/codec2/components/aom/Android.bp
    #  so only 1 of them has the official c2.android.av1.decoder name
    cflags = [
        "-DCODECNAME=\"c2.android.av1.decoder\""
    ];

    srcs = ["C2SoftGav1Dec.cpp"];
    static_libs = ["libgav1"];

    include_dirs = [
        "external/libgav1/libgav1/"
    ];
};

in { inherit libcodec2_soft_av1dec_gav1; }

{ cc_library }:
let

libmkvextractor = cc_library {
    name = "libmkvextractor";
    defaults = ["extractor-defaults"];

    srcs = ["MatroskaExtractor.cpp"];

    include_dirs = [
        "external/flac/include"
        "external/libvpx/libwebm"
        "frameworks/av/media/libstagefright/flac/dec"
    ];

    shared_libs = [
        "libstagefright_flacdec"
    ];

    static_libs = [
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libwebm"
        "libutils"
    ];

};

in { inherit libmkvextractor; }

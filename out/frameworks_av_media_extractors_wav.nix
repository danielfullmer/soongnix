{ cc_library }:
let

libwavextractor = cc_library {
    name = "libwavextractor";

    defaults = ["extractor-defaults"];

    srcs = ["WAVExtractor.cpp"];

    include_dirs = [
        "frameworks/av/media/libstagefright/include"
    ];

    shared_libs = [
        "libbase"
        "libbinder_ndk"
    ];

    static_libs = [
        "libaudioutils"
        "libfifo"
        "libstagefright_foundation"
    ];
};

in { inherit libwavextractor; }

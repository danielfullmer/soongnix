{ cc_library }:
let

libflacextractor = cc_library {
    name = "libflacextractor";
    defaults = ["extractor-defaults"];

    srcs = ["FLACExtractor.cpp"];

    include_dirs = [
        "external/flac/include"
    ];

    shared_libs = [
        "libbase"
        "libbinder_ndk"
    ];

    static_libs = [
        "libaudioutils"
        "libFLAC"
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libutils"
    ];

};

in { inherit libflacextractor; }

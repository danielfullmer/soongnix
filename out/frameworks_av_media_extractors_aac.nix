{ cc_library }:
let

libaacextractor = cc_library {
    name = "libaacextractor";
    defaults = ["extractor-defaults"];

    srcs = ["AACExtractor.cpp"];

    static_libs = [
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libutils"
    ];

};

in { inherit libaacextractor; }

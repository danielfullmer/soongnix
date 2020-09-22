{ cc_library }:
let

libmp4extractor = cc_library {
    name = "libmp4extractor";
    defaults = ["extractor-defaults"];

    srcs = [
        "AC4Parser.cpp"
        "ItemTable.cpp"
        "MPEG4Extractor.cpp"
        "SampleIterator.cpp"
        "SampleTable.cpp"
    ];

    static_libs = [
        "libstagefright_esds"
        "libstagefright_foundation"
        "libstagefright_id3"
        "libutils"
    ];
};

in { inherit libmp4extractor; }

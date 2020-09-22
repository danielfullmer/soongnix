{ cc_library }:
let

libmp3extractor = cc_library {
    name = "libmp3extractor";
    defaults = ["extractor-defaults"];
    srcs = [
        "MP3Extractor.cpp"
        "VBRISeeker.cpp"
        "XINGSeeker.cpp"
    ];

    static_libs = [
        "libutils"
        "libstagefright_id3"
        "libstagefright_foundation"
    ];

};

in { inherit libmp3extractor; }

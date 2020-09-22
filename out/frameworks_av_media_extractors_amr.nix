{ cc_library }:
let

libamrextractor = cc_library {
    name = "libamrextractor";
    defaults = ["extractor-defaults"];

    srcs = ["AMRExtractor.cpp"];

    static_libs = [
        "libstagefright_foundation"
    ];

};

in { inherit libamrextractor; }

{ cc_library }:
let

libmidiextractor = cc_library {
    name = "libmidiextractor";
    defaults = ["extractor-defaults"];

    srcs = ["MidiExtractor.cpp"];

    header_libs = [
        "libmedia_headers"
    ];

    static_libs = [
        "libmedia_midiiowrapper"
        "libsonivoxwithoutjet"
        "libstagefright_foundation"
        "libwatchdog"
    ];

    shared_libs = [
        "libbase"
    ];
};

in { inherit libmidiextractor; }

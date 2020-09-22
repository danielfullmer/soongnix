{ cc_library }:
let

liboggextractor = cc_library {
    name = "liboggextractor";

    defaults = ["extractor-defaults"];

    srcs = ["OggExtractor.cpp"];

    include_dirs = [
        "external/tremolo"
    ];

    header_libs = [
        "libaudio_system_headers"
    ];

    static_libs = [
        "libstagefright_foundation"
        "libstagefright_metadatautils"
        "libutils"
        "libvorbisidec"
    ];

};

in { inherit liboggextractor; }

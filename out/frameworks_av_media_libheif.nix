{ cc_library_shared }:
let

libheif = cc_library_shared {
    name = "libheif";

    srcs = [
        "HeifDecoderImpl.cpp"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
        "libmedia"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    include_dirs = [];

    export_include_dirs = ["include"];
};

in { inherit libheif; }

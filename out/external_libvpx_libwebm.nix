{ cc_library_static }:
let

libwebm = cc_library_static {
    name = "libwebm";
    srcs = ["mkvparser/mkvparser.cc"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["."];
    sanitize = {
        #  Enable CFI if this becomes a shared library.
        #  cfi: true,
    };
};

in { inherit libwebm; }

{ cc_library_static }:
let

libgif = cc_library_static {
    name = "libgif";

    sdk_version = "9";

    srcs = [
        "dgif_lib.c"
        "egif_lib.c"
        "gifalloc.c"
        "gif_err.c"
        "gif_hash.c"
        "openbsd-reallocarray.c"
        "quantize.c"
    ];

    cflags = [
        "-Werror"
        "-Wno-format"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-DHAVE_CONFIG_H"
    ];

    export_include_dirs = ["."];
};

in { inherit libgif; }

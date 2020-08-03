{ cc_library_static }:
let

libg722codec = cc_library_static {
    name = "libg722codec";
    defaults = ["fluoride_defaults"];
    cflags = [
        "-DG722_SUPPORT_MALLOC"
    ];
    srcs = [
        "g722_decode.cc"
        "g722_encode.cc"
    ];
};

in { inherit libg722codec; }

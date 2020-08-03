{ cc_library_shared }:
let

libsonic = cc_library_shared {
    name = "libsonic";

    srcs = ["sonic.c"];

    cflags = [
        "-Wno-sequence-point"
        "-Wno-extra"
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["."];
    cpp_std = "c++98";
};

in { inherit libsonic; }

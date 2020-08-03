{ cc_binary }:
let

mpeg2dec = cc_binary {
    name = "mpeg2dec";

    cflags = [
        "-DPROFILE_ENABLE"
        "-DMD5_DISABLE"
        "-DARM"
        "-fPIC"
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = [
        "decoder/"
    ];
    srcs = ["decoder/main.c"];
    static_libs = ["libmpeg2dec"];
    shared_libs = ["liblog"];
};

in { inherit mpeg2dec; }

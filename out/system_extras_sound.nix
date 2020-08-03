{ cc_binary }:
let

sound = cc_binary {
    name = "sound";
    srcs = ["playwav.c"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit sound; }

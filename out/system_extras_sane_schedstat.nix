{ cc_binary }:
let

sane_schedstat = cc_binary {
    name = "sane_schedstat";

    srcs = ["sane_schedstat.c"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit sane_schedstat; }

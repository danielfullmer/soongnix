{ cc_binary }:
let

uevents = cc_binary {
    name = "uevents";
    srcs = ["uevents.c"];
    shared_libs = ["libcutils"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit uevents; }

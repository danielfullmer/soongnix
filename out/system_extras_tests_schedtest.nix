{ cc_binary }:
let

schedtest = cc_binary {
    name = "schedtest";
    srcs = ["schedtest.c"];
    cflags = [
        "-Wno-unused-parameter"
        "-Wall"
        "-Werror"
    ];
};

in { inherit schedtest; }

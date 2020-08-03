{ cc_binary }:
let

directiotest = cc_binary {
    name = "directiotest";
    srcs = ["directiotest.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit directiotest; }

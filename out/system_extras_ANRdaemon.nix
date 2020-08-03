{ cc_binary }:
let

anrd = cc_binary {
    name = "anrd";
    srcs = ["ANRdaemon.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "liblog"
        "libbinder"
        "libcutils"
        "libutils"
        "libz"
    ];
};

in { inherit anrd; }

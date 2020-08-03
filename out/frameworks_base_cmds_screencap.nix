{ cc_binary }:
let

screencap = cc_binary {
    name = "screencap";

    srcs = ["screencap.cpp"];

    shared_libs = [
        "libcutils"
        "libutils"
        "libbinder"
        "libhwui"
        "libui"
        "libgui"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit screencap; }

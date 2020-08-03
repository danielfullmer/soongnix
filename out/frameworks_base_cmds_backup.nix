{ cc_binary }:
let

#  Copyright 2009 The Android Open Source Project

btool = cc_binary {
    name = "btool";

    srcs = ["backup.cpp"];

    shared_libs = [
        "libcutils"
        "libutils"
        "libandroidfw"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit btool; }

{ cc_binary }:
let

#  Copyright 2015 The Android Open Source Project

bootctl = cc_binary {
    name = "bootctl";
    srcs = ["bootctl.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "android.hardware.boot@1.0"
        "android.hardware.boot@1.1"
        "libhidlbase"
        "libutils"
    ];
};

in { inherit bootctl; }

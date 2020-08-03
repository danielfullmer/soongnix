{ cc_binary }:
let

#  Copyright 2009 The Android Open Source Project

rawbu = cc_binary {
    name = "rawbu";

    srcs = ["backup.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = ["libcutils"];
};

in { inherit rawbu; }

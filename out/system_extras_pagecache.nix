{ cc_binary }:
let

#  Copyright 2015 The Android Open Source Project

dumpcache = cc_binary {
    name = "dumpcache";

    srcs = ["dumpcache.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libcutils"];
};

in { inherit dumpcache; }

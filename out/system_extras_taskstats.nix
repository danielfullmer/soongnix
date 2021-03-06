{ cc_binary }:
let

#  Copyright 2013 The Android Open Source Project

taskstats = cc_binary {
    name = "taskstats";

    srcs = ["taskstats.c"];

    shared_libs = ["libnl"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit taskstats; }

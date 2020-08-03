{ cc_binary }:
let

#  Copyright 2013 The Android Open Source Project

opentest = cc_binary {
    name = "opentest";
    srcs = ["opentest.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

wipe_blkdev = cc_binary {
    name = "wipe_blkdev";
    srcs = ["wipe_blkdev.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit opentest wipe_blkdev; }

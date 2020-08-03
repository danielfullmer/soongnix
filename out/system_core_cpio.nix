{ cc_binary_host }:
let

#  Copyright 2005 The Android Open Source Project

mkbootfs = cc_binary_host {
    name = "mkbootfs";
    srcs = ["mkbootfs.c"];
    cflags = ["-Werror"];
    shared_libs = ["libcutils"];
    dist = {
        targets = ["dist_files"];
    };
};

in { inherit mkbootfs; }

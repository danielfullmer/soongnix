{ cc_binary }:
let

#  Copyright 2007 The Android Open Source Project

showslab = cc_binary {
    name = "showslab";

    srcs = ["showslab.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit showslab; }

{ cc_binary_host }:
let

#  Copyright 2005 The Android Open Source Project
#
#  Custom version of cp.

acp = cc_binary_host {

    srcs = ["acp.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = ["libhost"];
    name = "acp";
    stl = "none";

};

in { inherit acp; }

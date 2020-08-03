{ cc_binary_host }:
let

#  Copyright 2009 Google Inc. All Rights Reserved.
#
#  Android.mk for etc1tool
#

etc1tool = cc_binary_host {
    name = "etc1tool";

    srcs = ["etc1tool.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libexpat"
        "libpng"
        "libETC1"
        "libz"
    ];

    target = {
        windows = {
            enabled = true;
        };
    };
};

in { inherit etc1tool; }

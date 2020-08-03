{ cc_binary_host }:
let

#  Copyright 2007 The Android Open Source Project
#
#  Copies files into the directory structure described by a manifest

line_endings = cc_binary_host {
    name = "line_endings";
    srcs = ["line_endings.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit line_endings; }

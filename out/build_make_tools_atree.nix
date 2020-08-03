{ cc_binary_host }:
let

#  Copyright 2007 The Android Open Source Project
#
#  Copies files into the directory structure described by a manifest

atree = cc_binary_host {
    name = "atree";
    srcs = [
        "atree.cpp"
        "files.cpp"
        "fs.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = ["libhost"];
};

in { inherit atree; }

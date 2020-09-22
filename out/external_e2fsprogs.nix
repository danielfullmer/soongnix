{ cc_defaults }:
let

#  Copyright 2017 The Android Open Source Project

e2fsprogs-defaults = cc_defaults {
    name = "e2fsprogs-defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        darwin = {
            #  Still has unfixed/unsuppressed warnings.
            cflags = ["-Wno-error"];
        };
        windows = {
            cflags = [
                "-Wno-typedef-redefinition"
                "-Wno-unused-parameter"
                "-Wno-unused-variable"
            ];
        };
    };
};

subdirs = [
    "contrib"
    "debugfs"
    "e2fsck"
    "lib"
    "misc"
    "resize"
];

in { inherit e2fsprogs-defaults; }

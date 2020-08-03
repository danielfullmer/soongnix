{ cc_binary }:
let

#  Copyright 2013 The Android Open Source Project

get_dm_versions = cc_binary {
    name = "get_dm_versions";
    srcs = ["get_dm_versions.c"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit get_dm_versions; }

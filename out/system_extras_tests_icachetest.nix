{ cc_binary }:
let

#  Copyright 2006 The Android Open Source Project

icache = cc_binary {
    name = "icache";

    srcs = [
        "icache_main.cpp"
        "Profiler.cpp"
        "icache.S"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    enabled = false;
    arch = {
        arm = {
            enabled = true;
        };
    };
};

in { inherit icache; }

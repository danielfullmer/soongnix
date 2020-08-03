{ cc_binary }:
let

#  Copyright 2010 The Android Open Source Project

pftest = cc_binary {
    name = "pftest";

    srcs = ["pftest.c"];

    cflags = [
        "-fomit-frame-pointer"
        "-Wall"
        "-Werror"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

in { inherit pftest; }

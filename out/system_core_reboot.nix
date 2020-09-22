{ cc_binary }:
let

#  Copyright 2013 The Android Open Source Project

reboot = cc_binary {
    name = "reboot";
    srcs = ["reboot.c"];
    shared_libs = ["libcutils"];
    cflags = ["-Werror"];
    recovery_available = true;
};

in { inherit reboot; }

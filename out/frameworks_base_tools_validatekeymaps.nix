{ cc_binary_host }:
let

#
#  Copyright 2010 The Android Open Source Project
#
#  Keymap validation tool.
#

validatekeymaps = cc_binary_host {
    name = "validatekeymaps";

    srcs = ["Main.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libbase"
        "libinput"
        "libutils"
        "libcutils"
        "liblog"
    ];

    #  This tool is prebuilt if we're doing an app-only build.
    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
};

in { inherit validatekeymaps; }

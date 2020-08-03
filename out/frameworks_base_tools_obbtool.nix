{ cc_binary_host }:
let

#
#  Copyright 2010 The Android Open Source Project
#
#  Opaque Binary Blob (OBB) Tool
#

obbtool = cc_binary_host {
    name = "obbtool";

    srcs = ["Main.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-mismatched-tags"
    ];

    static_libs = [
        "libandroidfw"
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

# ####################################################
pbkdf2gen = cc_binary_host {
    name = "pbkdf2gen";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-mismatched-tags"
    ];
    srcs = ["pbkdf2gen.cpp"];
    static_libs = ["libcrypto"];

    #  This tool is prebuilt if we're doing an app-only build.
    product_variables = {
        unbundled_build = {
            enabled = false;
        };
    };
};

in { inherit obbtool pbkdf2gen; }

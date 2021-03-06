{ cc_library }:
let

#  Copyright (C) 2015 The Android Open Source Project

liblz4 = cc_library {
    name = "liblz4";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    host_supported = true;
    target = {
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
        };
    };
    srcs = [
        "lz4.c"
        "lz4hc.c"
        "lz4frame.c"
        "xxhash.c"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["."];
};

in { inherit liblz4; }

{ cc_library }:
let

#  Copyright 2017 The Android Open Source Project

libfec_rs = cc_library {
    name = "libfec_rs";
    host_supported = true;
    recovery_available = true;
    srcs = [
        "encode_rs_char.c"
        "decode_rs_char.c"
        "init_rs_char.c"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-O3"
    ];
    export_include_dirs = ["."];

    target = {
        linux = {
            sanitize = {
                misc_undefined = ["integer"];
            };
        };
        windows = {
            enabled = true;
        };
    };
};

in { inherit libfec_rs; }

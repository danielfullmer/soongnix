{ cc_binary_host, cc_defaults }:
let

#  Copyright 2016 The Android Open Source Project
dt_defaults = cc_defaults {
    name = "dt_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-sign-compare"
        "-Wno-missing-field-initializers"
        "-Wno-unused-parameter"
    ];

    static_libs = ["libfdt"];

    stl = "none";
    dist = {
        targets = [
            "dist_files"
        ];
        dir = "dtc";
    };
};

dtc = cc_binary_host {
    name = "dtc";
    defaults = ["dt_defaults"];
    srcs = [
        "checks.c"
        "data.c"
        "dtc.c"
        "dtc-lexer.l"
        "dtc-parser.y"
        "flattree.c"
        "fstree.c"
        "livetree.c"
        "srcpos.c"
        "treesource.c"
        "util.c"
    ];
};

fdtget = cc_binary_host {
    name = "fdtget";
    defaults = ["dt_defaults"];
    srcs = [
        "fdtget.c"
        "util.c"
    ];
};

in { inherit dt_defaults dtc fdtget; }

{ cc_binary_host }:
let

fs_get_stats = cc_binary_host {
    name = "fs_get_stats";
    srcs = ["fs_get_stats.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

in { inherit fs_get_stats; }

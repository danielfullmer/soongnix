{ cc_binary }:
let

zram-perf = cc_binary {
    name = "zram-perf";
    cflags = [
        "-g"
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
    srcs = ["zram-perf.cpp"];
};

in { inherit zram-perf; }

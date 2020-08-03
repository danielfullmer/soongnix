{ cc_binary_host }:
let

#  Copyright (C) 2016 The Android Open Source Project

lz4 = cc_binary_host {
    name = "lz4";
    srcs = [
        "datagen.c"
        "bench.c"
        "lz4io.c"
        "lz4cli.c"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = ["liblz4"];
    stl = "libc++_static";
};

lz4c = cc_binary_host {
    name = "lz4c";
    cflags = [
        "-DENABLE_LZ4C_LEGACY_OPTIONS"
        "-Wall"
        "-Werror"
    ];
    srcs = [
        "datagen.c"
        "bench.c"
        "lz4io.c"
        "lz4cli.c"
    ];
    static_libs = ["liblz4"];
    stl = "libc++_static";
};

in { inherit lz4 lz4c; }

{ cc_binary }:
let

fsverity = cc_binary {
    name = "fsverity";
    shared_libs = ["libcrypto"];
    cflags = [
        "-Wall"
        "-Wno-pointer-arith"
        "-D_FILE_OFFSET_BITS=64"
    ];
    srcs = [
        "cmd_enable.c"
        "cmd_measure.c"
        "cmd_setup.c"
        "elide_patch.c"
        "fsverity.c"
        "hash_algs.c"
        "sign.c"
        "util.c"
    ];
};

in { inherit fsverity; }

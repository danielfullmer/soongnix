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
    srcs = ["*.c"];
};

in { inherit fsverity; }

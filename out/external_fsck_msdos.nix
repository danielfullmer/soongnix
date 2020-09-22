{ cc_binary }:
let

fsck_msdos = cc_binary {
    name = "fsck_msdos";
    srcs = [
        "boot.c"
        "check.c"
        "dir.c"
        "fat.c"
        "fsutil.c"
        "main.c"
    ];
    include_dirs = ["external/fsck_msdos/"];
    cflags = [
        "-O2"
        "-g"
        "-Wall"
        "-Werror"
        "-D_BSD_SOURCE"
        "-D_LARGEFILE_SOURCE"
        "-D_FILE_OFFSET_BITS=64"
        "-Wno-unused-variable"
        "-Wno-unused-const-variable"
        "-Wno-format"
        "-Wno-sign-compare"
        "-include freebsd-compat.h"
    ];
};

in { inherit fsck_msdos; }

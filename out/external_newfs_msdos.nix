{ cc_binary }:
let

newfs_msdos = cc_binary {
    name = "newfs_msdos";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
        "-D_FILE_OFFSET_BITS=64"
        "-D_GNU_SOURCE"
        "-DSIGINFO=SIGUSR2"
        "-Dnitems(x)=(sizeof((x))/sizeof((x)[0]))"
    ];
    srcs = [
        "mkfs_msdos.c"
        "newfs_msdos.c"
    ];
    host_supported = true;
};

in { inherit newfs_msdos; }

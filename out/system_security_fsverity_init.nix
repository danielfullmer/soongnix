{ cc_binary }:
let

fsverity_init = cc_binary {
    name = "fsverity_init";
    srcs = [
        "fsverity_init.cpp"
    ];
    static_libs = [
        "libc++fs"
        "libmini_keyctl_static"
    ];
    shared_libs = [
        "libbase"
        "libkeyutils"
        "liblog"
        "liblogwrap"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit fsverity_init; }

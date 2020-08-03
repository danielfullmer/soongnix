{ cc_binary }:
let

cpustats = cc_binary {
    name = "cpustats";
    srcs = ["cpustats.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit cpustats; }

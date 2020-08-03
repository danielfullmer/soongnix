{ cc_binary }:
let

nfacct = cc_binary {
    name = "nfacct";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-format"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"

        "-DHAVE_LIBNL20"
    ];

    srcs = ["nfacct.c"];

    shared_libs = ["libnl"];
};

in { inherit nfacct; }

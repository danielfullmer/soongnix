{ cc_binary }:
let

runconuid = cc_binary {
    name = "runconuid";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = ["runconuid.cpp"];

    shared_libs = ["libselinux"];
};

in { inherit runconuid; }

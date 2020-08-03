{ cc_binary }:
let

bugreport = cc_binary {
    name = "bugreport";
    srcs = ["bugreport.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libcutils"];
};

in { inherit bugreport; }

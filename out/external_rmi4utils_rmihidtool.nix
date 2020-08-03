{ cc_binary }:
let

rmihidtool = cc_binary {
    name = "rmihidtool";
    srcs = ["main.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    static_libs = ["rmidevice"];
};

in { inherit rmihidtool; }

{ cc_binary }:
let

f54test = cc_binary {
    name = "f54test";
    srcs = [
        "main.cpp"
        "f54test.cpp"
        "testutil.cpp"
        "display.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-sometimes-uninitialized"
        "-Wno-unused-parameter"
    ];
    static_libs = ["rmidevice"];
};

in { inherit f54test; }

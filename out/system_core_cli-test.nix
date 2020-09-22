{ cc_binary }:
let

cli-test = cc_binary {
    name = "cli-test";
    host_supported = true;
    srcs = ["cli-test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libbase"];
};

in { inherit cli-test; }

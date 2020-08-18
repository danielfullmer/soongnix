{ cc_binary }:
let

test-nusensors = cc_binary {
    name = "test-nusensors";

    srcs = ["nusensors.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "libhardware"
    ];
};

in { inherit test-nusensors; }

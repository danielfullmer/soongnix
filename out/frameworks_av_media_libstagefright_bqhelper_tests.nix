{ cc_test }:
let

FrameDropper_test = cc_test {
    name = "FrameDropper_test";

    srcs = ["FrameDropper_test.cpp"];

    shared_libs = [
        "libstagefright_bufferqueue_helper"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit FrameDropper_test; }

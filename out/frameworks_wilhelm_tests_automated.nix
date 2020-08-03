{ cc_test }:
let

#  Build the unit tests.

BufferQueue_test = cc_test {
    name = "BufferQueue_test";

    srcs = ["BufferQueue_test.cpp"];

    shared_libs = ["libOpenSLES"];

    static_libs = ["libOpenSLESUT"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit BufferQueue_test; }

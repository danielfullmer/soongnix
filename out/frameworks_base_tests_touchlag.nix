{ cc_test }:
let

test-touchlag = cc_test {
    name = "test-touchlag";
    gtest = false;
    srcs = ["touchlag.cpp"];
    shared_libs = [
        "libcutils"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

in { inherit test-touchlag; }

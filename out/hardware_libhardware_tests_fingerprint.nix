{ cc_test }:
let

fingerprint_tests = cc_test {
    name = "fingerprint_tests";
    srcs = ["fingerprint_tests.cpp"];

    shared_libs = [
        "liblog"
        "libhardware"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

in { inherit fingerprint_tests; }

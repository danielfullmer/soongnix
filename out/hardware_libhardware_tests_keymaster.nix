{ cc_test }:
let

#  Build the keymaster unit tests
keymaster_test = cc_test {
    name = "keymaster_test";
    srcs = ["keymaster_test.cpp"];

    shared_libs = [
        "liblog"
        "libutils"
        "libcrypto"
        "libhardware"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit keymaster_test; }

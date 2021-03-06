{ cc_test }:
let

shared_mem_test = cc_test {
    name = "shared_mem_test";
    gtest = false;

    srcs = ["shared_mem_test.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libbinder"
        "libhardware_legacy"
        "libmedia"
        "libaudioclient"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit shared_mem_test; }

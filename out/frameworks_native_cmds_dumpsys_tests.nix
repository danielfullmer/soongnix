{ cc_test }:
let

#  Build the unit tests for dumpsys
dumpsys_test = cc_test {
    name = "dumpsys_test";
    test_suites = ["device-tests"];

    srcs = ["dumpsys_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "libbinder"
        "libutils"
    ];

    static_libs = [
        "libdumpsys"
        "libgmock"
        "libserviceutils"
    ];

    clang = true;
};

in { inherit dumpsys_test; }

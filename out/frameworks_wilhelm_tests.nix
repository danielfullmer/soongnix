{ cc_test }:
let

#  Build the unit tests.
libopenslestests = cc_test {
    name = "libopenslestests";

    shared_libs = ["libOpenSLES"];

    srcs = ["mimeUri_test.cpp"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

#  Build the manual test programs.
subdirs = ["*"];

in { inherit libopenslestests; }

{ cc_test }:
let

#  slesTest_playStream

slesTest_playStream = cc_test {
    name = "slesTest_playStream";
    gtest = false;

    srcs = ["slesTestPlayStream.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit slesTest_playStream; }

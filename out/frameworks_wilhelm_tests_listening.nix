{ cc_test }:
let

slesTest_seekTorture = cc_test {
    name = "slesTest_seekTorture";
    gtest = false;

    srcs = ["seekTorture.c"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

slesTest_playMuteSolo = cc_test {
    name = "slesTest_playMuteSolo";
    gtest = false;

    srcs = ["slesTest_playMuteSolo.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
};

in { inherit slesTest_playMuteSolo slesTest_seekTorture; }

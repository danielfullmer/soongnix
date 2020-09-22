{ cc_test }:
let

#  slesTest_playStates

slesTest_playStates = cc_test {
    name = "slesTest_playStates";
    gtest = false;

    srcs = ["slesTest_playStates.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_playStreamType

slesTest_playStreamType = cc_test {
    name = "slesTest_playStreamType";
    gtest = false;

    srcs = ["slesTestPlayStreamType.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_playUri

slesTest_playUri = cc_test {
    name = "slesTest_playUri";
    gtest = false;

    srcs = ["slesTestPlayUri.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_loopUri

slesTest_loopUri = cc_test {
    name = "slesTest_loopUri";
    gtest = false;

    srcs = ["slesTestLoopUri.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_playUri2

slesTest_playUri2 = cc_test {
    name = "slesTest_playUri2";
    gtest = false;

    srcs = ["slesTestPlayUri2.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];

};

#  slesTest_slowDownUri

slesTest_slowDownUri = cc_test {
    name = "slesTest_slowDownUri";
    gtest = false;

    srcs = ["slesTestSlowDownUri.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_manyPlayers

slesTest_manyPlayers = cc_test {
    name = "slesTest_manyPlayers";
    gtest = false;

    srcs = ["slesTestManyPlayers.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  slesTest_getPositionUri

slesTest_getPositionUri = cc_test {
    name = "slesTest_getPositionUri";
    gtest = false;

    srcs = ["slesTestGetPositionUri.cpp"];

    shared_libs = ["libOpenSLES"];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

in { inherit slesTest_getPositionUri slesTest_loopUri slesTest_manyPlayers slesTest_playStates slesTest_playStreamType slesTest_playUri slesTest_playUri2 slesTest_slowDownUri; }

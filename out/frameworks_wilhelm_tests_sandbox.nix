{ cc_test }:
let

#  intbufq

slesTest_intbufq = cc_test {
    name = "slesTest_intbufq";
    gtest = false;

    srcs = [
        "intbufq.c"
        "getch.c"
    ];

    shared_libs = [
        "liblog"
        "libOpenSLES"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  multiplay

slesTest_multiplay = cc_test {
    name = "slesTest_multiplay";
    gtest = false;

    srcs = ["multiplay.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];

};

#  engine

slesTest_engine = cc_test {
    name = "slesTest_engine";
    gtest = false;

    srcs = ["engine.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  object

slesTest_object = cc_test {
    name = "slesTest_object";
    gtest = false;

    srcs = ["object.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  configbq

slesTest_configbq = cc_test {
    name = "slesTest_configbq";
    gtest = false;

    srcs = ["configbq.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  reverb

slesTest_reverb = cc_test {
    name = "slesTest_reverb";
    gtest = false;

    srcs = ["reverb.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  srcsink

slesTest_srcsink = cc_test {
    name = "slesTest_srcsink";
    gtest = false;

    srcs = ["srcsink.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  outputmix

slesTest_outputmix = cc_test {
    name = "slesTest_outputmix";
    gtest = false;

    srcs = ["outputmix.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  urimime

slesTest_urimime = cc_test {
    name = "slesTest_urimime";
    gtest = false;

    srcs = ["urimime.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  dim

slesTest_dim = cc_test {
    name = "slesTest_dim";
    gtest = false;

    srcs = ["dim.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  multithread

slesTest_multithread = cc_test {
    name = "slesTest_multithread";
    gtest = false;

    srcs = ["multithread.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  playbq

slesTest_playbq = cc_test {
    name = "slesTest_playbq";
    gtest = false;

    srcs = ["playbq.cpp"];

    shared_libs = [
        "libaudioutils"
        "libnbaio"
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "libsndfile"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  monkey

slesTest_monkey = cc_test {
    name = "slesTest_monkey";
    gtest = false;

    srcs = ["monkey.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  xa

slesTest_xa = cc_test {
    name = "slesTest_xa";
    gtest = false;

    srcs = ["xa.c"];

    shared_libs = [
        "liblog"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
    ];
};

#  dual

slesTest_dual = cc_test {
    name = "slesTest_dual";
    gtest = false;

    srcs = ["dual.c"];

    shared_libs = [
        "liblog"
        "libOpenSLES"
        "libOpenMAXAL"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        "-UNDEBUG"
        "-Wno-deprecated-declarations"
    ];
};

#  xaplay

slesTest_xaplay = cc_test {
    name = "slesTest_xaplay";
    gtest = false;

    srcs = [
        "xaplay.c"
        "nativewindow.cpp"
    ];

    shared_libs = [
        "libutils"
        "liblog"
        "libOpenMAXAL"
        "libui"
        "libgui"
        "libbinder"
        "libandroid"
    ];

    static_libs = [
        "libOpenSLESUT"
        "liblog"
    ];

    cflags = [
        "-UNDEBUG"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

subdirs = ["streamSource"];

in { inherit slesTest_configbq slesTest_dim slesTest_dual slesTest_engine slesTest_intbufq slesTest_monkey slesTest_multiplay slesTest_multithread slesTest_object slesTest_outputmix slesTest_playbq slesTest_reverb slesTest_srcsink slesTest_urimime slesTest_xa slesTest_xaplay; }

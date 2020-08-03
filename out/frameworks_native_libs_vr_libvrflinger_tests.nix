{ cc_test }:
let

shared_libs = [
    "android.hardware.configstore-utils"
    "android.hardware.configstore@1.0"
    "libbinder"
    "libbufferhubqueue"
    "libcutils"
    "libgui"
    "libhidlbase"
    "liblog"
    "libui"
    "libutils"
    "libnativewindow"
    "libpdx_default_transport"
];

static_libs = [
    "libdisplay"
];

vrflinger_test = cc_test {
    srcs = ["vrflinger_test.cpp"];
    #  See go/apct-presubmit for documentation on how this .filter file is used
    #  by Android's automated testing infrastructure for test filtering.
    data = ["vrflinger_test.filter"];
    static_libs = static_libs;
    shared_libs = shared_libs;
    cflags = [
        "-DLOG_TAG=\"VrFlingerTest\""
        "-DTRACE=0"
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
    ];
    name = "vrflinger_test";
};

in { inherit vrflinger_test; }

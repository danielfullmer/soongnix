{ cc_benchmark }:
let

buffer_transport_benchmark = cc_benchmark {
    srcs = ["buffer_transport_benchmark.cpp"];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libdvr.google"
        "libgui"
        "liblog"
        "libhardware"
        "libui"
        "libutils"
        "libnativewindow"
        "libbufferhubqueue"
        "libpdx_default_transport"
    ];
    cflags = [
        "-DLOG_TAG=\"buffer_transport_benchmark\""
        "-DTRACE=0"
        "-O2"
        "-Wall"
        "-Werror"
    ];
    name = "buffer_transport_benchmark";
};

in { inherit buffer_transport_benchmark; }

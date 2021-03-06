{ cc_test }:
let

header_libraries = [
    "libdvr_headers"
];

shared_libraries = [
    "libbase"
    "libbinder"
    "libbufferhubqueue"
    "libcutils"
    "libgui"
    "liblog"
    "libhardware"
    "libui"
    "libutils"
    "libnativewindow"
    "libpdx_default_transport"
];

static_libraries = [
    "libchrome"
    "libdvrcommon"
    "libperformance"
];

buffer_hub_queue-test = cc_test {
    srcs = ["buffer_hub_queue-test.cpp"];
    header_libs = header_libraries;
    static_libs = static_libraries;
    shared_libs = shared_libraries;
    cflags = [
        "-DLOG_TAG=\"buffer_hub_queue-test\""
        "-DTRACE=0"
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
        "-Wno-error=sign-compare" #  to fix later
    ];
    name = "buffer_hub_queue-test";
};

buffer_hub_queue_producer-test = cc_test {
    srcs = ["buffer_hub_queue_producer-test.cpp"];
    header_libs = header_libraries;
    static_libs = static_libraries;
    shared_libs = shared_libraries;
    cflags = [
        "-DLOG_TAG=\"buffer_hub_queue_producer-test\""
        "-DTRACE=0"
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
    ];
    name = "buffer_hub_queue_producer-test";
};

in { inherit buffer_hub_queue-test buffer_hub_queue_producer-test; }

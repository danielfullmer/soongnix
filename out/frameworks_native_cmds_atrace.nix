{ cc_binary }:
let

#  Copyright 2012 The Android Open Source Project

atrace = cc_binary {
    name = "atrace";
    srcs = ["atrace.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbinder"
        "libhwbinder"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "libcutils"
        "libz"
        "libbase"
        "libpdx_default_transport"
        "android.hardware.atrace@1.0"
    ];

    init_rc = ["atrace.rc"];

    product_variables = {
        debuggable = {
            init_rc = ["atrace_userdebug.rc"];
        };
    };
};

in { inherit atrace; }

{ cc_library }:
let

#  Copyright 2012 The Android Open Source Project

libsuspend = cc_library {
    name = "libsuspend";
    srcs = [
        "autosuspend.c"
        "autosuspend_wakeup_count.cpp"
    ];
    export_include_dirs = ["include"];
    local_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "liblog"
        "libcutils"
    ];
    cflags = [
        "-Werror"
        #  "-DLOG_NDEBUG=0",
    ];
};

in { inherit libsuspend; }

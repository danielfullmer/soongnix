{ cc_binary, cc_library_shared }:
let

#  Copyright 2013 The Android Open Source Project

libmemtrack = cc_library_shared {
    name = "libmemtrack";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = ["memtrack.cpp"];
    export_include_dirs = ["include"];
    local_include_dirs = ["include"];
    include_dirs = ["hardware/libhardware/include"];
    shared_libs = [
        "libhardware"
        "liblog"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
        "android.hardware.memtrack@1.0"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

memtrack_test = cc_binary {
    name = "memtrack_test";
    srcs = ["memtrack_test.cpp"];
    static_libs = ["libc++fs"];
    shared_libs = [
        "libbase"
        "libmemtrack"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit libmemtrack memtrack_test; }

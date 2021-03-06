{ cc_defaults, cc_library_shared, cc_test }:
let

#  Copyright 2016 The Android Open Source Project

libappfuse_defaults = cc_defaults {
    name = "libappfuse_defaults";
    local_include_dirs = ["include"];
    shared_libs = ["libbase"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

libappfuse = cc_library_shared {
    name = "libappfuse";
    defaults = ["libappfuse_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "FuseAppLoop.cc"
        "FuseBuffer.cc"
        "FuseBridgeLoop.cc"
        "EpollController.cc"
    ];
};

libappfuse_test = cc_test {
    name = "libappfuse_test";
    test_suites = ["device-tests"];
    defaults = ["libappfuse_defaults"];
    shared_libs = ["libappfuse"];
    srcs = [
        "tests/FuseAppLoopTest.cc"
        "tests/FuseBridgeLoopTest.cc"
        "tests/FuseBufferTest.cc"
    ];
};

in { inherit libappfuse libappfuse_defaults libappfuse_test; }

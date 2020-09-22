{ cc_test }:
let

omx_tests = cc_test {
    name = "omx_tests";
    gtest = false;

    srcs = ["OMXHarness.cpp"];

    shared_libs = [
        "libstagefright"
        "libbinder"
        "libdatasource"
        "libmedia"
        "libmedia_omx"
        "libutils"
        "liblog"
        "libstagefright_foundation"
        "libcutils"
        "libhidlbase"
        "libhidlmemory"
        "libnativewindow"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];

    header_libs = [
        "libbase_headers"
        "libmediametrics_headers"
        "media_ndk_headers"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    compile_multilib = "32";
};

in { inherit omx_tests; }

{ cc_library }:
let

libfootest = cc_library {
    name = "libfootest";
    defaults = ["hidl_defaults"];
    srcs = [
        "FooHelper.cpp"
    ];

    shared_libs = [
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
    ];
    static_libs = ["android.hardware.tests.foo@1.0"];

    local_include_dirs = ["include/hidl-test"];
    export_include_dirs = ["include"];

};

in { inherit libfootest; }

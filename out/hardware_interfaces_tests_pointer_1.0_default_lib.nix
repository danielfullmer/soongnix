{ cc_library }:
let

libpointertest = cc_library {
    name = "libpointertest";
    defaults = ["hidl_defaults"];
    srcs = [
        "PointerHelper.cpp"
    ];

    shared_libs = [
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "liblog"
    ];
    static_libs = ["android.hardware.tests.pointer@1.0"];

    local_include_dirs = ["include/hidl-test"];
    export_include_dirs = ["include"];

};

in { inherit libpointertest; }

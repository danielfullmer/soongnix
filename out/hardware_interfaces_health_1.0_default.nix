{ cc_library_static }:
let

"android.hardware.health@1.0-convert" = cc_library_static {
    name = "android.hardware.health@1.0-convert";
    vendor_available = true;
    recovery_available = true;
    srcs = ["convert.cpp"];
    include_dirs = [
        "system/core/base/include"
    ];
    header_libs = ["libhealthd_headers"];
    export_header_lib_headers = ["libhealthd_headers"];
    export_include_dirs = ["include"];
    shared_libs = [
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.health@1.0"
    ];

};

in { inherit "android.hardware.health@1.0-convert"; }

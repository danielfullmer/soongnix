{ cc_library_headers }:
let

"android.hardware.graphics.composer@2.1-passthrough" = cc_library_headers {
    name = "android.hardware.graphics.composer@2.1-passthrough";
    defaults = ["hidl_defaults"];
    vendor = true;
    shared_libs = [
        "libhardware"
        "libhwc2on1adapter"
        "libhwc2onfbadapter"
    ];
    export_shared_lib_headers = [
        "libhardware"
        "libhwc2on1adapter"
        "libhwc2onfbadapter"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.1-hal"
    ];
    export_header_lib_headers = [
        "android.hardware.graphics.composer@2.1-hal"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.composer@2.1-passthrough"; }

{ cc_library_headers }:
let

"android.hardware.graphics.composer@2.2-passthrough" = cc_library_headers {
    name = "android.hardware.graphics.composer@2.2-passthrough";
    defaults = ["hidl_defaults"];
    vendor = true;
    header_libs = [
        "android.hardware.graphics.composer@2.1-passthrough"
        "android.hardware.graphics.composer@2.2-hal"
    ];
    export_header_lib_headers = [
        "android.hardware.graphics.composer@2.1-passthrough"
        "android.hardware.graphics.composer@2.2-hal"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.composer@2.2-passthrough"; }

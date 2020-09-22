{ cc_library_headers }:
let

"android.hardware.graphics.composer@2.4-command-buffer" = cc_library_headers {
    name = "android.hardware.graphics.composer@2.4-command-buffer";
    defaults = ["hidl_defaults"];
    vendor_available = true;
    shared_libs = [
        "android.hardware.graphics.composer@2.4"
    ];
    export_shared_lib_headers = [
        "android.hardware.graphics.composer@2.4"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.3-command-buffer"
    ];
    export_header_lib_headers = [
        "android.hardware.graphics.composer@2.3-command-buffer"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.composer@2.4-command-buffer"; }

{ cc_library_headers }:
let

"android.hardware.graphics.composer@2.3-command-buffer" = cc_library_headers {
    name = "android.hardware.graphics.composer@2.3-command-buffer";
    defaults = ["hidl_defaults"];
    vendor_available = true;
    shared_libs = [
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.2"
        "android.hardware.graphics.composer@2.3"
    ];
    header_libs = [
        "android.hardware.graphics.composer@2.1-command-buffer"
        "android.hardware.graphics.composer@2.2-command-buffer"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.composer@2.3-command-buffer"; }

{ cc_library_headers }:
let

"android.hardware.graphics.composer@2.1-command-buffer" = cc_library_headers {
    name = "android.hardware.graphics.composer@2.1-command-buffer";
    defaults = ["hidl_defaults"];
    vendor_available = true;
    shared_libs = [
        "android.hardware.graphics.composer@2.1"
        "libfmq"
        "libsync"
    ];
    export_shared_lib_headers = [
        "android.hardware.graphics.composer@2.1"
        "libfmq"
        "libsync"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.composer@2.1-command-buffer"; }

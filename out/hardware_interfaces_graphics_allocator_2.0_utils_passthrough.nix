{ cc_library_headers }:
let

"android.hardware.graphics.allocator@2.0-passthrough" = cc_library_headers {
    name = "android.hardware.graphics.allocator@2.0-passthrough";
    defaults = ["hidl_defaults"];
    vendor = true;
    shared_libs = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.mapper@2.0"
        "libhardware"
    ];
    export_shared_lib_headers = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.mapper@2.0"
        "libhardware"
    ];
    header_libs = [
        "android.hardware.graphics.allocator@2.0-hal"
        "android.hardware.graphics.mapper@2.0-passthrough_headers"
    ];
    export_header_lib_headers = [
        "android.hardware.graphics.allocator@2.0-hal"
        "android.hardware.graphics.mapper@2.0-passthrough_headers"
    ];
    export_include_dirs = ["include"];
};

in { inherit "android.hardware.graphics.allocator@2.0-passthrough"; }

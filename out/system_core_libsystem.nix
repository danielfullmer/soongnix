{ cc_library_headers }:
let

libsystem_headers = cc_library_headers {
    name = "libsystem_headers";
    vendor_available = true;
    recovery_available = true;
    host_supported = true;
    native_bridge_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "apex_inherit";
    export_include_dirs = ["include"];

    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
};

in { inherit libsystem_headers; }

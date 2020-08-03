{ cc_library_headers }:
let

libaudio_system_headers = cc_library_headers {
    name = "libaudio_system_headers";
    host_supported = true;
    vendor_available = true;

    header_libs = ["libcutils_headers"];
    export_header_lib_headers = ["libcutils_headers"];

    export_include_dirs = ["include"];

    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
        vendor = {
            cflags = ["-DAUDIO_NO_SYSTEM_DECLARATIONS"];
        };
    };
};

in { inherit libaudio_system_headers; }

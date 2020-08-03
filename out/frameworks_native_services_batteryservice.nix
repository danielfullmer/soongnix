{ cc_library_headers }:
let

libbatteryservice_headers = cc_library_headers {
    name = "libbatteryservice_headers";
    vendor_available = true;
    recovery_available = true;
    export_include_dirs = ["include"];
    header_libs = ["libutils_headers"];
    export_header_lib_headers = ["libutils_headers"];
};

in { inherit libbatteryservice_headers; }

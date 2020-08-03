{ cc_library_headers }:
let

internal_include_headers = cc_library_headers {
    name = "internal_include_headers";
    export_include_dirs = ["./"];
    vendor_available = true;
    host_supported = true;
};

in { inherit internal_include_headers; }

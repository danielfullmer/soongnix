{ cc_library_headers }:
let

libFLAC-config = cc_library_headers {
    name = "libFLAC-config";
    export_include_dirs = ["."];
    vendor_available = true;
};

libFLAC-headers = cc_library_headers {
    name = "libFLAC-headers";
    export_include_dirs = ["include"];
    vendor_available = true;
};

subdirs = ["libFLAC"];

in { inherit libFLAC-config libFLAC-headers; }

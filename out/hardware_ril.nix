{ cc_library_headers }:
let

ril_headers = cc_library_headers {
    name = "ril_headers";
    vendor = true;
    export_include_dirs = ["include"];
};

in { inherit ril_headers; }

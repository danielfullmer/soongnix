{ cc_library_headers }:
let

libloc_pla_headers = cc_library_headers {

    name = "libloc_pla_headers";
    export_include_dirs = ["android"];
    vendor = true;
};

in { inherit libloc_pla_headers; }

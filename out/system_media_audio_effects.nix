{ cc_library_headers }:
let

libaudioeffects = cc_library_headers {
    name = "libaudioeffects";
    vendor_available = true;
    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];
    export_include_dirs = ["include"];
};

in { inherit libaudioeffects; }

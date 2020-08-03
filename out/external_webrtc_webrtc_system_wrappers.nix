{ cc_library_headers }:
let

subdirs = ["source"];

libwebrtc_system_wrappers_headers = cc_library_headers {
    name = "libwebrtc_system_wrappers_headers";
    vendor = true;
    export_include_dirs = ["include"];
};

in { inherit libwebrtc_system_wrappers_headers; }

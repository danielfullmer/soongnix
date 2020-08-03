{ cc_library_headers }:
let

subdirs = ["source"];

libwebrtc_isac_interface = cc_library_headers {
    name = "libwebrtc_isac_interface";
    vendor = true;
    export_include_dirs = ["include"];
};

in { inherit libwebrtc_isac_interface; }

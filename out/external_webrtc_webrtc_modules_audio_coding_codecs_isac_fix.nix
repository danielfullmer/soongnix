{ cc_library_headers }:
let

subdirs = ["*"];

libwebrtc_isacfix_headers = cc_library_headers {
    name = "libwebrtc_isacfix_headers";
    vendor = true;
    export_include_dirs = ["include"];
};

in { inherit libwebrtc_isacfix_headers; }

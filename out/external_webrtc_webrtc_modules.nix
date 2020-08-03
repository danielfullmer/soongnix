{ cc_library_headers }:
let

subdirs = [
    "audio_coding/codecs/isac/fix"
    "audio_coding/codecs/isac/main"
    "audio_processing"
];

libwebrtc_modules_headers = cc_library_headers {
    name = "libwebrtc_modules_headers";
    vendor = true;
    export_include_dirs = ["include"];
};

in { inherit libwebrtc_modules_headers; }

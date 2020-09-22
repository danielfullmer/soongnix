{ cc_library_headers }:
let

libaudiopolicycommon = cc_library_headers {
    name = "libaudiopolicycommon";
    header_libs = [
        "libaudiofoundation_headers"
    ];
    export_include_dirs = ["include"];
};

in { inherit libaudiopolicycommon; }

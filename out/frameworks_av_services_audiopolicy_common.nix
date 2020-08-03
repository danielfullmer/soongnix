{ cc_library_headers }:
let

libaudiopolicycommon = cc_library_headers {
    name = "libaudiopolicycommon";
    export_include_dirs = ["include"];
};

in { inherit libaudiopolicycommon; }

{ cc_library_headers }:
let

subdirs = ["*"];

libdrm_test_headers = cc_library_headers {
    name = "libdrm_test_headers";
    export_include_dirs = ["."];
};

in { inherit libdrm_test_headers; }

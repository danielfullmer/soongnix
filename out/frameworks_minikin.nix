{ cc_library_headers }:
let

libminikin_headers = cc_library_headers {
    name = "libminikin_headers";
    host_supported = true;
    export_include_dirs = ["include"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

subdirs = [
    "app"
    "libs/minikin"
    "tests"
];

in { inherit libminikin_headers; }

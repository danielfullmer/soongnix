{ cc_library_headers }:
let

libaaudio_example_utils = cc_library_headers {
    name = "libaaudio_example_utils";
    export_include_dirs = ["utils"];
};

in { inherit libaaudio_example_utils; }

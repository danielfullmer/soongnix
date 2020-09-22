{ cc_library_headers }:
let

libpdfium-constants = cc_library_headers {
    name = "libpdfium-constants";
    export_include_dirs = ["."];
    visibility = ["//external/pdfium:__subpackages__"];
};

in { inherit libpdfium-constants; }

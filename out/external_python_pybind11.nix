{ cc_library_headers }:
let

pybind11_headers = cc_library_headers {
    name = "pybind11_headers";
    host_supported = true;
    export_include_dirs = ["include"];
};

in { inherit pybind11_headers; }

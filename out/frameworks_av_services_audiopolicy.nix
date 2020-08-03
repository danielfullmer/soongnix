{ cc_library_headers }:
let

libaudiopolicymanager_interface_headers = cc_library_headers {
    name = "libaudiopolicymanager_interface_headers";
    host_supported = true;
    export_include_dirs = ["."];
};

in { inherit libaudiopolicymanager_interface_headers; }

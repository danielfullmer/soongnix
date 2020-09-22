{ cc_library_headers }:
let

libstorage_literals_headers = cc_library_headers {
    name = "libstorage_literals_headers";
    host_supported = true;
    recovery_available = true;
    export_include_dirs = ["."];
};

in { inherit libstorage_literals_headers; }

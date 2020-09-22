{ cc_library, cc_library_headers }:
let

libpsi_headers = cc_library_headers {
    name = "libpsi_headers";
    export_include_dirs = ["include"];
};

libpsi = cc_library {
    name = "libpsi";
    srcs = ["psi.cpp"];
    shared_libs = [
        "liblog"
    ];
    header_libs = [
        "libpsi_headers"
    ];
    export_header_lib_headers = [
        "libpsi_headers"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit libpsi libpsi_headers; }

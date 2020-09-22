{ cc_library_static }:
let

libpropertyinfoparser = cc_library_static {
    name = "libpropertyinfoparser";
    host_supported = true;
    vendor_available = true;
    ramdisk_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    srcs = ["property_info_parser.cpp"];

    cpp_std = "experimental";
    cppflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    stl = "none";
    system_shared_libs = [];
    header_libs = ["libc_headers"];
    export_include_dirs = ["include"];
};

in { inherit libpropertyinfoparser; }

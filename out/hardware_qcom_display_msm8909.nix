{ cc_defaults, cc_library_headers, soong_namespace }:
let

_missingName = soong_namespace {
};

display_defaults = cc_defaults {
    name = "display_defaults";
    cflags = [
        "-Wno-missing-field-initializers"
        "-Wconversion"
        "-Wall"
        "-Werror"
        "-std=c++14"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
    ];
    header_libs = ["display_headers"];
    clang = true;
};

display_headers = cc_library_headers {
    name = "display_headers";
    vendor_available = true;
    export_include_dirs = [
        "include"
        "libcopybit"
        "libdrmutils"
        "libqdutils"
        "libqservice"
        "gpu_tonemapper"
        "sdm/include"
        "gralloc"
    ];
    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];
};

display_intf_headers = cc_library_headers {
    name = "display_intf_headers";
    vendor_available = true;
    export_include_dirs = [
        "include"
        "libqdutils"
        "gralloc"
    ];
    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];
};

subdirs = [
    "libqservice"
    "libqdutils"
];

in { inherit _missingName display_defaults display_headers display_intf_headers; }

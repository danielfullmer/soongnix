{ cc_defaults, cc_library_headers }:
let

display_defaults = cc_defaults {
    name = "display_defaults";
    cflags = [
        "-Wno-missing-field-initializers"
        "-Wconversion"
        "-Wall"
        "-Werror"
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
        "libdebug"
        "libhistogram"
    ];
    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];
};

display_intf_headers = cc_library_headers {
    name = "display_intf_headers";
    vendor_available = true;
    export_include_dirs = [
        "include"
        "libcopybit"
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

in { inherit display_defaults display_headers display_intf_headers; }

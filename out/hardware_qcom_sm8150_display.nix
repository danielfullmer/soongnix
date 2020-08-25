{ cc_defaults, cc_library_headers, display_go_defaults, soong_namespace }:
let

_missingName = soong_namespace {
};

_bp2nix_display_go_defaults = display_go_defaults {
    name = "display_go_defaults";
};

display_defaults = cc_defaults {
    name = "display_defaults";
    defaults = ["display_go_defaults"];
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
    defaults = ["display_go_defaults"];
    vendor = true;
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
    header_libs = [
        "libhardware_headers"
        "//vendor/qcom/sm8150:display_intf_headers"
    ];
    export_header_lib_headers = [
        "libhardware_headers"
        "//vendor/qcom/sm8150:display_intf_headers"
    ];
};

subdirs = [
    "libqservice"
    "libqdutils"
];

in { inherit _missingName display_defaults display_headers; display_go_defaults = _bp2nix_display_go_defaults; }

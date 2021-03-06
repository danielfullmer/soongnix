{ cc_library }:
let

#  Effect configuration
libeffectsconfig = cc_library {
    name = "libeffectsconfig";
    vendor_available = true;

    srcs = ["src/EffectsConfig.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "liblog"
        "libtinyxml2"
    ];

    header_libs = ["libaudio_system_headers"];
    export_header_lib_headers = ["libaudio_system_headers"];

    export_include_dirs = ["include"];
};

in { inherit libeffectsconfig; }

{ cc_binary, cc_defaults, cc_library_static }:
let

dumpsys_defaults = cc_defaults {
    name = "dumpsys_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "dumpsys.cpp"
    ];

    shared_libs = [
        "libbase"
        "libutils"
        "liblog"
        "libbinder"
    ];

    static_libs = [
        "libserviceutils"
    ];
};

#
#  Static library used in testing and executable
#

libdumpsys = cc_library_static {
    name = "libdumpsys";

    defaults = ["dumpsys_defaults"];

    export_include_dirs = ["."];
};

#
#  Executable
#

dumpsys = cc_binary {
    name = "dumpsys";

    defaults = ["dumpsys_defaults"];

    srcs = [
        "main.cpp"
    ];
};

dumpsys_vendor = cc_binary {
    name = "dumpsys_vendor";
    stem = "dumpsys";

    vendor = true;

    defaults = ["dumpsys_defaults"];

    srcs = [
        "main.cpp"
    ];
};

in { inherit dumpsys dumpsys_defaults dumpsys_vendor libdumpsys; }

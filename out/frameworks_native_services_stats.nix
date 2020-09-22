{ cc_library_shared }:
let

libstatshidl = cc_library_shared {
    name = "libstatshidl";
    srcs = [
        "StatsHal.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "android.frameworks.stats@1.0"
        "libhidlbase"
        "liblog"
        "libstatslog"
        "libstatssocket"
        "libutils"
    ];
    export_include_dirs = [
        "include/"
    ];
    local_include_dirs = [
        "include/stats"
    ];
    vintf_fragments = ["android.frameworks.stats@1.0-service.xml"];
};

in { inherit libstatshidl; }

{ cc_binary, cc_library_static }:
let

lmkd = cc_binary {
    name = "lmkd";

    srcs = ["lmkd.c"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libprocessgroup"
        "libpsi"
    ];
    static_libs = [
        "libstatslogc"
        "libstatssocket"
    ];
    local_include_dirs = ["include"];
    cflags = [
        "-Werror"
        "-DLMKD_TRACE_KILLS"
    ];
    init_rc = ["lmkd.rc"];
    product_variables = {
        use_lmkd_stats_log = {
            cflags = [
                "-DLMKD_LOG_STATS"
            ];
        };
    };
    logtags = ["event.logtags"];
};

libstatslogc = cc_library_static {
    name = "libstatslogc";
    srcs = ["statslog.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = ["libstatssocket"];
};

liblmkd_utils = cc_library_static {
    name = "liblmkd_utils";
    srcs = ["liblmkd_utils.c"];
    shared_libs = [
        "libcutils"
    ];
    export_include_dirs = ["include"];
    cppflags = [
        "-g"
        "-Wall"
        "-Werror"
    ];
};

in { inherit liblmkd_utils libstatslogc lmkd; }

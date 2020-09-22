{ cc_binary, cc_defaults, cc_library_static, genrule }:
let

stats_defaults = cc_defaults {
    name = "stats_defaults";

    product_variables = {
        use_lmkd_stats_log = {
            cflags = [
                "-DLMKD_LOG_STATS"
            ];
        };
    };
};

lmkd = cc_binary {
    name = "lmkd";

    srcs = ["lmkd.cpp"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libprocessgroup"
        "libpsi"
        "libstatssocket"
    ];
    static_libs = [
        "libstatslogc"
        "libstatslog_lmkd"
        "liblmkd_utils"
    ];
    local_include_dirs = ["include"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-DLMKD_TRACE_KILLS"
    ];
    init_rc = ["lmkd.rc"];
    defaults = ["stats_defaults"];
    logtags = ["event.logtags"];
};

libstatslogc = cc_library_static {
    name = "libstatslogc";
    srcs = ["statslog.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    defaults = ["stats_defaults"];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libstatslog_lmkd"
    ];
};

"statslog_lmkd.h" = genrule {
    name = "statslog_lmkd.h";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --header $(genDir)/statslog_lmkd.h --module lmkd --namespace android,lmkd,stats";
    out = [
        "statslog_lmkd.h"
    ];
};

"statslog_lmkd.cpp" = genrule {
    name = "statslog_lmkd.cpp";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --cpp $(genDir)/statslog_lmkd.cpp --module lmkd --namespace android,lmkd,stats --importHeader statslog_lmkd.h";
    out = [
        "statslog_lmkd.cpp"
    ];
};

libstatslog_lmkd = cc_library_static {
    name = "libstatslog_lmkd";
    generated_sources = ["statslog_lmkd.cpp"];
    generated_headers = ["statslog_lmkd.h"];
    export_generated_headers = ["statslog_lmkd.h"];
    shared_libs = [
        "libstatssocket"
    ];
};

liblmkd_utils = cc_library_static {
    name = "liblmkd_utils";
    srcs = ["liblmkd_utils.cpp"];
    recovery_available = true;
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

in { inherit "statslog_lmkd.cpp" "statslog_lmkd.h" liblmkd_utils libstatslog_lmkd libstatslogc lmkd stats_defaults; }

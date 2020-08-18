{ cc_binary }:
let

stats_client = cc_binary {
    name = "stats_client";
    srcs = [
        "StatsClient.cpp"
    ];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libmetricslogger"
        "libutils"
        "libstatslog"
        "android.frameworks.stats@1.0"
    ];
};

in { inherit stats_client; }

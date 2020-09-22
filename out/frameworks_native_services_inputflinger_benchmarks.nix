{ cc_benchmark }:
let

inputflinger_benchmarks = cc_benchmark {
    name = "inputflinger_benchmarks";
    srcs = [
        "InputDispatcher_benchmarks.cpp"
    ];
    defaults = ["inputflinger_defaults"];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libinput"
        "libinputflinger_base"
        "libinputreporter"
        "liblog"
        "libstatslog"
        "libui"
        "libutils"
    ];
    static_libs = [
        "libinputdispatcher"
    ];
};

in { inherit inputflinger_benchmarks; }

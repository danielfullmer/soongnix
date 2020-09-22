{ cc_benchmark, cc_binary, cc_defaults, cc_library }:
let

logwrapper_defaults = cc_defaults {
    name = "logwrapper_defaults";
    cflags = [
        "-Werror"
    ];
};

#  ========================================================
#  Static and shared library
#  ========================================================

liblogwrap = cc_library {
    name = "liblogwrap";
    defaults = ["logwrapper_defaults"];
    recovery_available = true;
    srcs = ["logwrap.cpp"];
    shared_libs = [
        "libcutils"
        "liblog"
    ];
    header_libs = ["libbase_headers"];
    export_include_dirs = ["include"];
    local_include_dirs = ["include"];
};

#  ========================================================
#  Executable
#  ========================================================

logwrapper_common = cc_defaults {
    name = "logwrapper_common";
    defaults = ["logwrapper_defaults"];
    local_include_dirs = ["include"];
    srcs = [
        "logwrap.cpp"
        "logwrapper.cpp"
    ];
    header_libs = ["libbase_headers"];
    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

logwrapper = cc_binary {
    name = "logwrapper";
    defaults = ["logwrapper_common"];
};

logwrapper_vendor = cc_binary {
    name = "logwrapper_vendor";
    defaults = ["logwrapper_common"];
    stem = "logwrapper";
    vendor = true;
};

#  ========================================================
#  Benchmark
#  ========================================================

logwrap_fork_execvp_benchmark = cc_benchmark {
    name = "logwrap_fork_execvp_benchmark";
    defaults = ["logwrapper_defaults"];
    srcs = [
        "logwrap_fork_execvp_benchmark.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "liblogwrap"
    ];
};

in { inherit liblogwrap logwrap_fork_execvp_benchmark logwrapper logwrapper_common logwrapper_defaults logwrapper_vendor; }

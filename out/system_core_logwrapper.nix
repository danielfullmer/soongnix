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
    srcs = ["logwrap.c"];
    shared_libs = [
        "libcutils"
        "liblog"
    ];
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
        "logwrap.c"
        "logwrapper.c"
    ];
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

android_fork_execvp_ext_benchmark = cc_benchmark {
    name = "android_fork_execvp_ext_benchmark";
    defaults = ["logwrapper_defaults"];
    srcs = [
        "android_fork_execvp_ext_benchmark.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "liblogwrap"
    ];
};

in { inherit android_fork_execvp_ext_benchmark liblogwrap logwrapper logwrapper_common logwrapper_defaults logwrapper_vendor; }

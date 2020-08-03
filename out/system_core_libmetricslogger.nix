{ cc_defaults, cc_library, cc_library_shared, cc_test }:
let

#  Copyright 2017 The Android Open Source Project

metricslogger_lib_src_files = [
    "metrics_logger.cpp"
];

metricslogger_defaults = cc_defaults {
    name = "metricslogger_defaults";

    host_supported = true;

    export_include_dirs = ["include"];
    local_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "liblog"
        "libstatssocket"
    ];
    whole_static_libs = ["libgtest_prod"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

#  metricslogger shared library
#  -----------------------------------------------------------------------------
libmetricslogger = cc_library {
    name = "libmetricslogger";
    srcs = metricslogger_lib_src_files;
    defaults = ["metricslogger_defaults"];
    export_shared_lib_headers = ["libstatssocket"];
};

#  metricslogger shared library, debug
#  -----------------------------------------------------------------------------
libmetricslogger_debug = cc_library_shared {
    name = "libmetricslogger_debug";
    srcs = metricslogger_lib_src_files;
    defaults = ["metricslogger_defaults"];

    target = {
        host = {
            cflags = ["-UNDEBUG"];
        };
    };
};

#  Native tests
#  -----------------------------------------------------------------------------
metricslogger_tests = cc_test {
    name = "metricslogger_tests";
    isolated = true;
    defaults = ["metricslogger_defaults"];
    shared_libs = [
        "libbase"
        "libmetricslogger_debug"
    ];
    srcs = [
        "metrics_logger_test.cpp"
    ];
};

in { inherit libmetricslogger libmetricslogger_debug metricslogger_defaults metricslogger_tests; }

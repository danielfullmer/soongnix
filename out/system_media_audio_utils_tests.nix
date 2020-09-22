{ cc_binary, cc_binary_host, cc_test }:
let

#  Build the unit tests for audio_utils

fdtostring_tests = cc_test {
    name = "fdtostring_tests";
    host_supported = false;

    shared_libs = [
        "libcutils"
        "liblog"
        "libutils" # for systemTime
    ];
    srcs = ["fdtostring_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
    };
};

primitives_tests = cc_test {
    name = "primitives_tests";
    host_supported = true;

    shared_libs = [
        "liblog"
        "libcutils"
    ];
    srcs = ["primitives_tests.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

primitives_benchmark = cc_binary {
    name = "primitives_benchmark";
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };

    srcs = ["primitives_benchmark.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    static_libs = [
        "libgoogle-benchmark"
        "libaudioutils"
    ];
};

fifo_tests = cc_binary {
    name = "fifo_tests";
    host_supported = true;
    srcs = ["fifo_tests.cpp"];
    shared_libs = ["libaudioutils"];
    static_libs = ["libsndfile"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

fifo_multiprocess = cc_binary {
    name = "fifo_multiprocess";
    host_supported = false;
    srcs = ["fifo_multiprocess.cpp"];
    shared_libs = [
        "libaudioutils"
        "libcutils"
    ];
    static_libs = ["libsndfile"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

fifo_threads = cc_binary_host {
    name = "fifo_threads";
    #  TODO move getch.c and .h to a utility library
    srcs = [
        "fifo_threads.cpp"
        "getch.c"
    ];
    static_libs = [
        "libaudioutils"
        "liblog"
    ];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

limiter_tests = cc_binary_host {
    name = "limiter_tests";
    srcs = ["limiter_tests.c"];
    static_libs = ["libaudioutils"];
    cflags = [
        "-Werror"
        "-Wall"
        "-UNDEBUG"
    ];
};

power_tests = cc_test {
    name = "power_tests";
    host_supported = true;

    shared_libs = [
        "libcutils"
        "liblog"
    ];
    srcs = ["power_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

errorlog_tests = cc_test {
    name = "errorlog_tests";
    host_supported = false;

    shared_libs = [
        "libcutils"
        "liblog"
    ];
    srcs = ["errorlog_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

metadata_tests = cc_test {
    name = "metadata_tests";
    host_supported = false;

    shared_libs = [
        "libcutils"
        "liblog"
    ];
    srcs = ["metadata_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

powerlog_tests = cc_test {
    name = "powerlog_tests";
    host_supported = false;

    shared_libs = [
        "libcutils"
        "liblog"
    ];
    srcs = ["powerlog_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

simplelog_tests = cc_test {
    name = "simplelog_tests";
    host_supported = false;

    shared_libs = [
        "libcutils"
        "liblog"
    ];
    srcs = ["simplelog_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

channels_tests = cc_test {
    name = "channels_tests";
    host_supported = true;

    shared_libs = [
        "libcutils"
        "liblog"
    ];
    srcs = ["channels_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

string_tests = cc_test {
    name = "string_tests";
    host_supported = false;

    shared_libs = ["libaudioutils"];
    srcs = ["string_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

format_tests = cc_test {
    name = "format_tests";
    host_supported = true;

    shared_libs = [
        "liblog"
    ];
    srcs = ["format_tests.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

statistics_tests = cc_test {
    name = "statistics_tests";
    host_supported = false;

    header_libs = ["libaudioutils_headers"];
    srcs = ["statistics_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

timestampverifier_tests = cc_test {
    name = "timestampverifier_tests";
    host_supported = false;

    header_libs = ["libaudioutils_headers"];
    srcs = ["timestampverifier_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

variadic_tests = cc_test {
    name = "variadic_tests";
    host_supported = false;

    shared_libs = ["libaudioutils"];
    srcs = ["variadic_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

logplot_tests = cc_test {
    name = "logplot_tests";
    host_supported = true;

    shared_libs = [
        "liblog"
        "libcutils"
    ];
    srcs = ["logplot_tests.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

statistics_benchmark = cc_binary {
    name = "statistics_benchmark";
    host_supported = false;

    srcs = ["statistics_benchmark.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    static_libs = [
        "libgoogle-benchmark"
        "libaudioutils"
    ];
};

sample_tests = cc_test {
    name = "sample_tests";
    host_supported = true;

    shared_libs = [
        "liblog"
        "libcutils"
    ];
    srcs = ["sample_tests.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    target = {
        android = {
            shared_libs = ["libaudioutils"];
        };
        host = {
            static_libs = ["libaudioutils"];
        };
    };
};

spdif_tests = cc_test {
    name = "spdif_tests";

    shared_libs = [
        "libaudioutils"
        "libaudiospdif"
        "liblog"
        "libcutils"
    ];
    srcs = ["spdif_tests.cpp"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit channels_tests errorlog_tests fdtostring_tests fifo_multiprocess fifo_tests fifo_threads format_tests limiter_tests logplot_tests metadata_tests power_tests powerlog_tests primitives_benchmark primitives_tests sample_tests simplelog_tests spdif_tests statistics_benchmark statistics_tests string_tests timestampverifier_tests variadic_tests; }

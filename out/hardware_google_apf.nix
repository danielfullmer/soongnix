{ cc_binary_host, cc_defaults, cc_library_static, sh_test_host }:
let

#  Copyright 2016 The Android Open Source Project

apf_defaults = cc_defaults {
    name = "apf_defaults";

    cflags = [
        "-DAPF_FRAME_HEADER_SIZE=14"
        "-Wall"
        "-Werror"
        "-Werror=implicit-fallthrough"
        "-Wnullable-to-nonnull-conversion"
        "-Wsign-compare"
        "-Wthread-safety"
        "-Wunused-parameter"
        "-Wuninitialized"
    ];
};

libapf = cc_library_static {
    name = "libapf";
    defaults = ["apf_defaults"];
    srcs = ["apf_interpreter.c"];
    sdk_version = "24";
};

apf_disassembler = cc_binary_host {
    name = "apf_disassembler";
    defaults = ["apf_defaults"];
    srcs = [
        "apf_disassembler.c"
        "disassembler.c"
    ];
};

apf_run = cc_binary_host {
    name = "apf_run";
    defaults = ["apf_defaults"];
    static_libs = [
        "libpcap"
    ];
    srcs = [
        "apf_run.c"
        "apf_interpreter.c"
        "disassembler.c"
    ];
    cflags = [
        "-DAPF_TRACE_HOOK=apf_trace_hook"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

apf_run_test = sh_test_host {
    name = "apf_run_test";
    src = "apf_run_test.sh";
    filename = "apf_run_test.sh";
    test_suites = ["general-tests"];
    test_config = "apf_run_test.xml";
    required = [":apf_run"];
    data = [
        "testdata/large_ra_without_counters.output"
        "testdata/large_ra_without_counters.packet"
        "testdata/large_ra_without_counters.program"
        "testdata/one_ra_with_counters.data"
        "testdata/one_ra_with_counters.output"
        "testdata/one_ra_with_counters.packet"
        "testdata/one_ra_with_counters.program"
    ];
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
    };
};

in { inherit apf_defaults apf_disassembler apf_run apf_run_test libapf; }

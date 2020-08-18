{ cc_binary_host, cc_defaults, cc_library_static }:
let

#  Copyright 2016 The Android Open Source Project

apf_defaults = cc_defaults {
    name = "apf_defaults";

    cflags = [
        "-DAPF_FRAME_HEADER_SIZE=14"
        "-Wall"
        "-Werror"
    ];
};

libapf = cc_library_static {
    name = "libapf";
    defaults = ["apf_defaults"];
    srcs = ["apf_interpreter.c"];

};

apf_disassembler = cc_binary_host {
    name = "apf_disassembler";
    defaults = ["apf_defaults"];
    srcs = ["apf_disassembler.c"];
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

in { inherit apf_defaults apf_disassembler apf_run libapf; }

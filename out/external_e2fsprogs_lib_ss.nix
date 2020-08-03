{ cc_library }:
let

#  Copyright 2017 The Android Open Source Project

libext2_ss = cc_library {
    name = "libext2_ss";
    host_supported = true;
    unique_host_soname = true;
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "ss_err.c"
        "std_rqs.c"
        "invocation.c"
        "help.c"
        "execute_cmd.c"
        "listen.c"
        "parse.c"
        "error.c"
        "prompt.c"
        "request_tbl.c"
        "list_rqs.c"
        "pager.c"
        "requests.c"
        "data.c"
        "get_readline.c"
    ];
    shared_libs = ["libext2_com_err"];
    header_libs = ["libext2-headers"];
    export_include_dirs = ["."];
    export_header_lib_headers = ["libext2-headers"];
};

in { inherit libext2_ss; }

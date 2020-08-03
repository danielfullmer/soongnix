{ cc_binary, cc_library_static }:
let

libcmd = cc_library_static {
    name = "libcmd";

    srcs = ["cmd.cpp"];
    export_include_dirs = ["."];

    shared_libs = [
        "libutils"
        "liblog"
        "libselinux"
        "libbinder"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-DXP_UNIX"
    ];
};

cmd = cc_binary {
    name = "cmd";

    srcs = ["main.cpp"];

    static_libs = [
        "libcmd"
    ];

    shared_libs = [
        "libutils"
        "liblog"
        "libselinux"
        "libbinder"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-DXP_UNIX"
    ];
};

in { inherit cmd libcmd; }

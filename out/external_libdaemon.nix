{ cc_library_shared }:
let

libdaemon = cc_library_shared {
    name = "libdaemon";

    srcs = [
        "libdaemon/dexec.c"
        "libdaemon/dfork.c"
        "libdaemon/dlog.c"
        "libdaemon/dnonblock.c"
        "libdaemon/dpid.c"
        "libdaemon/dsignal.c"
    ];

    export_include_dirs = ["."];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=user-defined-warnings"
        "-Wno-unused-parameter"
        "-DHAVE_CONFIG_H"
        "-DLOCALSTATEDIR=\"/var\""
    ];
};

in { inherit libdaemon; }

{ cc_binary }:
let

ss = cc_binary {
    name = "ss";
    defaults = ["iproute2_defaults"];

    srcs = [
        "ss.c"
        "ssfilter.y"
    ];

    shared_libs = [
        "libiprouteutil"
        "libnetlink"
        "libselinux"
    ];

    cflags = [
        "-Wno-missing-field-initializers"
        "-Wno-tautological-pointer-compare"
        "-Dsethostent(x)="
    ];

    ldflags = ["-Wl,-export-dynamic"];
};

in { inherit ss; }

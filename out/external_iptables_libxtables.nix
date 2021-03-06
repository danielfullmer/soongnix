{ cc_library_static }:
let

# ----------------------------------------------------------------
#  libxtables

libxtables = cc_library_static {
    name = "libxtables";
    defaults = ["iptables_defaults"];

    header_libs = [
        "iptables_iptables_headers"
        "iptables_config_header"
    ];
    export_header_lib_headers = ["iptables_headers"];

    cflags = [
        "-DNO_SHARED_LIBS=1"
        "-DXTABLES_INTERNAL"
        "-DXTABLES_LIBDIR=\"xtables_libdir_not_used\""

        "-Wno-missing-field-initializers"
    ];

    srcs = [
        "xtables.c"
        "xtoptions.c"
    ];
};

in { inherit libxtables; }

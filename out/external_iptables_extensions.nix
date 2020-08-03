{ cc_defaults, cc_library_static, genrule, gensrcs }:
let

libext_defaults = cc_defaults {
    name = "libext_defaults";
    defaults = ["iptables_defaults"];

    header_libs = ["iptables_config_header"];

    cflags = [
        "-DNO_SHARED_LIBS=1"
        "-DXTABLES_INTERNAL"

        "-Wno-format"
        "-Wno-missing-field-initializers"
        #  libxt_recent.c:202:11: error: address of array 'info->name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
        "-Wno-pointer-bool-conversion"
        "-Wno-tautological-pointer-compare"
    ];
};

#  All of the extension source files have the same function name (_init). Since we don't support
#  per-file cflags that upstream uses, instead:
#
#   1. Rewrite the source files with filter_init to have per-file function names. (libext*_srcs)
#   2. Create a new source file that defines a function (init_extensions*) with gen_init that calls
#      all of the renamed _init functions (libext*_init)
#
#  This all happens three times -- once each for libext, libext4, libext6

libext_init = genrule {
    name = "libext_init";
    cmd = "$(location gen_init) '' $(locations libxt_*.c) > $(out)";
    srcs = [
        "gen_init"
        "libxt_*.c"
    ];
    out = ["initext.c"];
    exclude_srcs = [
        #  Exclude some modules that are problematic to compile (types/headers)
        "libxt_TCPOPTSTRIP.c"
        "libxt_connlabel.c"
        "libxt_cgroup.c"

        "libxt_dccp.c"
        "libxt_ipvs.c"
    ];
};

libext_srcs = gensrcs {
    name = "libext_srcs";
    tool_files = ["filter_init"];
    cmd = "$(location filter_init) $(in) > $(out)";
    output_extension = "c";
    srcs = ["libxt_*.c"];
    exclude_srcs = [
        #  Exclude some modules that are problematic to compile (types/headers)
        "libxt_TCPOPTSTRIP.c"
        "libxt_connlabel.c"
        "libxt_cgroup.c"

        "libxt_dccp.c"
        "libxt_ipvs.c"
    ];
};

libext = cc_library_static {
    name = "libext";
    defaults = ["libext_defaults"];
    srcs = [
        ":libext_init"
        ":libext_srcs"
    ];
};

# //////////////////////////////////////////////////////////////////////////////////////////////////

libext4_init = genrule {
    name = "libext4_init";
    cmd = "$(location gen_init) '4' $(locations libipt_*.c) > $(out)";
    srcs = [
        "gen_init"
        "libipt_*.c"
    ];
    out = ["initext.c"];
};

libext4_srcs = gensrcs {
    name = "libext4_srcs";
    tool_files = ["filter_init"];
    cmd = "$(location filter_init) $(in) > $(out)";
    output_extension = "c";
    srcs = ["libipt_*.c"];
};

libext4 = cc_library_static {
    name = "libext4";
    defaults = ["libext_defaults"];
    srcs = [
        ":libext4_init"
        ":libext4_srcs"
    ];
};

# //////////////////////////////////////////////////////////////////////////////////////////////////

libext6_init = genrule {
    name = "libext6_init";
    cmd = "$(location gen_init) '6' $(locations libip6t_*.c) > $(out)";
    srcs = [
        "gen_init"
        "libip6t_*.c"
    ];
    out = ["initext.c"];
};

libext6_srcs = gensrcs {
    name = "libext6_srcs";
    tool_files = ["filter_init"];
    cmd = "$(location filter_init) $(in) > $(out)";
    output_extension = "c";
    srcs = ["libip6t_*.c"];
};

libext6 = cc_library_static {
    name = "libext6";
    defaults = ["libext_defaults"];
    srcs = [
        ":libext6_init"
        ":libext6_srcs"
    ];
};

in { inherit libext libext4 libext4_init libext4_srcs libext6 libext6_init libext6_srcs libext_defaults libext_init libext_srcs; }

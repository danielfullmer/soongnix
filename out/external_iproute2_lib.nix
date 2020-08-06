{ cc_library_shared }:
let

libiprouteutil = cc_library_shared {
    name = "libiprouteutil";
    defaults = ["iproute2_defaults"];

    system_shared_libs = [
        "libc"
        "libdl"
    ];

    srcs = [
        "color.c"
        "utils.c"
        "rt_names.c"
        "ll_types.c"
        "ll_proto.c"
        "ll_addr.c"
        "inet_proto.c"
        "mpls_pton.c"
        "namespace.c"
        "names.c"
        "libgenl.c"
        "libnetlink.c"
        "bpf.c"
        "exec.c"
        "fs.c"
        "json_print.c"
        "json_writer.c"
    ];
    cflags = [
        "-DCONFDIR=\"/data/misc/net\""
        #("-DNETNS_RUN_DIR=\"" + NETNS_RUN_DIR + "\"")
        "-D_GNU_SOURCE"
    ];

    #  This is a work around for b/18403920
    ldflags = ["-Wl,--no-gc-sections"];
};

libnetlink = cc_library_shared {
    name = "libnetlink";
    defaults = ["iproute2_defaults"];

    system_shared_libs = ["libc"];
    srcs = [
        "ll_map.c"
        "libnetlink.c"
    ];
};

in { inherit libiprouteutil libnetlink; }

{ cc_binary_host }:
let

common_CFLAGS = [
    "-Wall"
    "-Werror"
    "-Wshadow"
];

checkpolicy = cc_binary_host {
    name = "checkpolicy";
    cflags = common_CFLAGS;
    srcs = [
        "policy_parse.y"
        "policy_scan.l"
        "queue.c"
        "module_compiler.c"
        "parse_util.c"
        "policy_define.c"
        "checkpolicy.c"
    ];
    static_libs = ["libsepol"];
};

dispol = cc_binary_host {
    name = "dispol";
    cflags = common_CFLAGS;
    srcs = ["test/dispol.c"];
    static_libs = ["libsepol"];
};

in { inherit checkpolicy dispol; }

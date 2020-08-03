{ cc_library_shared }:
let

sub_srcs = [
    "src/main.c"
    "src/callback.c"
    "src/conntrack/api.c"
    "src/conntrack/bsf.c"
    "src/conntrack/compare.c"
    "src/conntrack/copy.c"
    "src/conntrack/filter.c"
    "src/conntrack/filter_dump.c"
    "src/conntrack/getter.c"
    "src/conntrack/grp.c"
    "src/conntrack/grp_getter.c"
    "src/conntrack/grp_setter.c"
    "src/conntrack/setter.c"
    "src/conntrack/snprintf.c"
    "src/conntrack/snprintf_default.c"
    "src/conntrack/snprintf_xml.c"
    "src/conntrack/stack.c"
    "src/conntrack/parse.c"
    "src/conntrack/objopt.c"
    "src/conntrack/build.c"
    "src/conntrack/labels.c"
    "src/expect/api.c"
    "src/expect/build.c"
    "src/expect/compare.c"
    "src/expect/getter.c"
    "src/expect/parse.c"
    "src/expect/setter.c"
    "src/expect/snprintf.c"
    "src/expect/snprintf_default.c"
    "src/expect/snprintf_xml.c"
];

libnetfilter_conntrack = cc_library_shared {
    name = "libnetfilter_conntrack";
    export_include_dirs = ["include"];
    vendor = true;
    srcs = sub_srcs;
    cflags = [
        "-Wno-unused-parameter"
        "-Wno-sign-compare"
        "-Wno-pointer-arith"
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libnfnetlink"];
};

in { inherit libnetfilter_conntrack; }

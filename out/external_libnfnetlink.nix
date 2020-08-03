{ cc_library_shared }:
let

libnfnetlink = cc_library_shared {
    name = "libnfnetlink";
    export_include_dirs = ["include"];
    vendor = true;
    srcs = [
        "src/iftable.c"
        "src/libnfnetlink.c"
        "src/rtnl.c"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=pointer-sign"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-Wno-pointer-arith"
    ];
};

in { inherit libnfnetlink; }

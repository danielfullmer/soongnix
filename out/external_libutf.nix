{ cc_library_static }:
let

#  We only build the static library at the moment.
libutf = cc_library_static {
    name = "libutf";
    srcs = [
        "rune.c"
        "runestrcat.c"
        "runestrchr.c"
        "runestrcmp.c"
        "runestrcpy.c"
        "runestrdup.c"
        "runestrlen.c"
        "runestrecpy.c"
        "runestrncat.c"
        "runestrncmp.c"
        "runestrncpy.c"
        "runestrrchr.c"
        "runestrstr.c"
        "runetype.c"
        "utfecpy.c"
        "utflen.c"
        "utfnlen.c"
        "utfrrune.c"
        "utfrune.c"
        "utfutf.c"
    ];
    cflags = [
        "-O3"
        "-Wall"
        "-Wno-missing-braces"
        "-Wno-parentheses"
        "-Wno-switch"
    ];
    export_include_dirs = ["."];
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    sdk_version = "14";
};

in { inherit libutf; }

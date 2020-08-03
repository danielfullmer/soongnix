{ cc_binary, cc_binary_host, cc_defaults }:
let

awk-flags = cc_defaults {
    name = "awk-flags";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        #  Ignore a few harmless idioms widely used in this code.
        "-Wno-missing-field-initializers"
        "-Wno-self-assign"
        "-Wno-unused-parameter"
        #  A loop to UCHAR_MAX in `b.c`.
        "-Wno-sign-compare"
        #  And one less harmless used with strtod(3) in `lex.c`.
        "-Wno-unused-result"
        #  Also ignore harmless macro redefinitions: glibc 2.17 #defines dprintf
        #  in stdio2.h, and this #defines it in awk.h
        "-Wno-macro-redefined"
    ];
    yaccflags = [
        "-y"
    ];
};

#  TODO: we should actually rebuild awkgram.y and pass the output through maketab.
#  For now we just rebuild the checked-in generated files.
awk-maketab = cc_binary {
    name = "awk-maketab";
    defaults = ["awk-flags"];
    srcs = ["maketab.c"];
};

awk-defaults = cc_defaults {
    name = "awk-defaults";
    defaults = ["awk-flags"];

    srcs = [
        "b.c"
        "lex.c"
        "lib.c"
        "main.c"
        "parse.c"
        "proctab.c"
        "run.c"
        "tran.c"
        "ytab.c"
    ];
};

awk = cc_binary {
    name = "awk";
    defaults = ["awk-defaults"];
};

awk_vendor = cc_binary {
    name = "awk_vendor";
    defaults = ["awk-defaults"];
    stem = "awk";
    vendor = true;
};

one-true-awk = cc_binary_host {
    name = "one-true-awk";
    defaults = ["awk-defaults"];
};

in { inherit awk awk-defaults awk-flags awk-maketab awk_vendor one-true-awk; }

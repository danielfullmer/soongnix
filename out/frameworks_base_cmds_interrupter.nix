{ cc_library_shared }:
let

interrupter = cc_library_shared {
    name = "interrupter";
    host_supported = true;
    srcs = ["interrupter.c"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit interrupter; }

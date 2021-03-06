{ cc_binary }:
let

suspend_stress = cc_binary {
    name = "suspend_stress";
    srcs = ["suspend_stress.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_executable = true;
    static_libs = [
        "libc"
        "libbase"
        "libcutils"
    ];
};

in { inherit suspend_stress; }

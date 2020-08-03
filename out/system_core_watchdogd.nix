{ cc_binary }:
let

watchdogd = cc_binary {
    name = "watchdogd";
    recovery_available = true;
    srcs = ["watchdogd.cpp"];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = ["libbase"];
    sanitize = {
        misc_undefined = ["signed-integer-overflow"];
    };
};

in { inherit watchdogd; }

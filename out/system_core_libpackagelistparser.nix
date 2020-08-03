{ cc_library }:
let

libpackagelistparser = cc_library {

    name = "libpackagelistparser";
    recovery_available = true;
    srcs = ["packagelistparser.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["liblog"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    sanitize = {
        misc_undefined = ["integer"];
    };
};

in { inherit libpackagelistparser; }

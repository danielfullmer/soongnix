{ cc_binary }:
let

sdcard = cc_binary {
    srcs = ["sdcard.cpp"];
    name = "sdcard";
    cflags = [
        "-Wall"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libminijail"
    ];
    sanitize = {
        misc_undefined = ["integer"];
    };
};

in { inherit sdcard; }

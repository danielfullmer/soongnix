{ cc_binary }:
let

#  ========================================================
#  Executable
#  ========================================================
tzdatacheck = cc_binary {
    name = "tzdatacheck";
    host_supported = true;
    srcs = ["tzdatacheck.cpp"];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];
    cflags = ["-Werror"];
};

in { inherit tzdatacheck; }

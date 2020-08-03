{ cc_binary }:
let

#  ========================================================
#  Executable
#  ========================================================
flags_health_check = cc_binary {
    name = "flags_health_check";
    host_supported = true;
    srcs = ["disaster_recovery.cc"];
    shared_libs = [
        "libbase"
        "server_configurable_flags"
    ];
    cflags = [
        "-Werror"
    ];
    init_rc = ["flags_health_check.rc"];
};

in { inherit flags_health_check; }

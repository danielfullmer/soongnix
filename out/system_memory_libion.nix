{ cc_binary, cc_library }:
let

libion = cc_library {
    name = "libion";
    vendor_available = true;
    recovery_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    srcs = ["ion.c"];
    shared_libs = ["liblog"];
    local_include_dirs = [
        "include"
        "kernel-headers"
    ];
    export_include_dirs = [
        "include"
        "kernel-headers"
    ];
    cflags = ["-Werror"];
    min_sdk_version = "29";
};

iontest = cc_binary {
    name = "iontest";
    srcs = ["ion_test.c"];
    static_libs = ["libion"];
    shared_libs = ["liblog"];
    cflags = ["-Werror"];
};

subdirs = ["tests"];

in { inherit iontest libion; }

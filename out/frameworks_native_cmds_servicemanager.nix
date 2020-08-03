{ cc_binary, cc_defaults }:
let

servicemanager_flags = cc_defaults {
    name = "servicemanager_flags";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    product_variables = {
        binder32bit = {
            cflags = ["-DBINDER_IPC_32BIT=1"];
        };
    };

    shared_libs = ["liblog"];
};

bctest = cc_binary {
    name = "bctest";
    defaults = ["servicemanager_flags"];
    srcs = [
        "bctest.c"
        "binder.c"
    ];
};

servicemanager = cc_binary {
    name = "servicemanager";
    defaults = ["servicemanager_flags"];
    srcs = [
        "service_manager.c"
        "binder.c"
    ];
    shared_libs = [
        "libcutils"
        "libselinux"
    ];
    init_rc = ["servicemanager.rc"];
};

vndservicemanager = cc_binary {
    name = "vndservicemanager";
    defaults = ["servicemanager_flags"];
    vendor = true;
    srcs = [
        "service_manager.c"
        "binder.c"
    ];
    cflags = [
        "-DVENDORSERVICEMANAGER=1"
    ];
    shared_libs = [
        "libcutils"
        "libselinux"
    ];
    init_rc = ["vndservicemanager.rc"];
};

in { inherit bctest servicemanager servicemanager_flags vndservicemanager; }

{ cc_binary, cc_defaults, cc_test }:
let

servicemanager_defaults = cc_defaults {
    name = "servicemanager_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    srcs = [
        "Access.cpp"
        "ServiceManager.cpp"
    ];

    shared_libs = [
        "libbase"
        "libbinder" #  also contains servicemanager_interface
        "libvintf"
        "libcutils"
        "liblog"
        "libutils"
        "libselinux"
    ];

    target = {
        vendor = {
            exclude_shared_libs = ["libvintf"];
        };
    };
};

servicemanager = cc_binary {
    name = "servicemanager";
    defaults = ["servicemanager_defaults"];
    init_rc = ["servicemanager.rc"];
    srcs = ["main.cpp"];
};

vndservicemanager = cc_binary {
    name = "vndservicemanager";
    defaults = ["servicemanager_defaults"];
    init_rc = ["vndservicemanager.rc"];
    vendor = true;
    cflags = [
        "-DVENDORSERVICEMANAGER=1"
    ];
    srcs = ["main.cpp"];
};

servicemanager_test = cc_test {
    name = "servicemanager_test";
    test_suites = ["device-tests"];
    defaults = ["servicemanager_defaults"];
    srcs = [
        "test_sm.cpp"
    ];
    static_libs = ["libgmock"];
};

in { inherit servicemanager servicemanager_defaults servicemanager_test vndservicemanager; }

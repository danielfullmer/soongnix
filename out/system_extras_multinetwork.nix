{ cc_binary, cc_defaults }:
let

multinetwork_defaults = cc_defaults {
    name = "multinetwork_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];
    include_dirs = [
        "frameworks/native/include"
    ];

    srcs = [
        "common.cpp"
    ];

    shared_libs = [
        "libandroid"
        "libbase"
    ];

    product_variables = {
        #  The PDK build does not have access to frameworks/native elements.
        pdk = {
            enabled = false;
        };
    };
};

#  Sample util binaries.
dnschk = cc_binary {
    name = "dnschk";
    defaults = ["multinetwork_defaults"];

    srcs = [
        "dnschk.cpp"
    ];
};

httpurl = cc_binary {
    name = "httpurl";
    defaults = ["multinetwork_defaults"];

    srcs = [
        "httpurl.cpp"
    ];
};

in { inherit dnschk httpurl multinetwork_defaults; }

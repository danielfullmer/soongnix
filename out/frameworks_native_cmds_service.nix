{ cc_binary }:
let

service = cc_binary {
    name = "service";

    srcs = ["service.cpp"];

    shared_libs = [
        "libutils"
        "libbinder"
    ];

    cflags = [
        "-DXP_UNIX"
        "-Wall"
        "-Werror"
    ];
};

vndservice = cc_binary {
    name = "vndservice";

    proprietary = true;
    srcs = ["service.cpp"];

    shared_libs = [
        "libutils"
        "libbinder"
    ];

    cflags = [
        "-DXP_UNIX"
        "-DVENDORSERVICES"
        "-Wall"
        "-Werror"
    ];
};

in { inherit service vndservice; }

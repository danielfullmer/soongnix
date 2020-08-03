{ cc_binary }:
let

accessorychat = cc_binary {
    name = "accessorychat";
    host_supported = true;

    srcs = ["accessorychat.c"];
    cflags = [
        "-Werror"
        "-Wno-unused-parameter"
    ];

    target = {
        android = {
            shared_libs = [
                "libusbhost"
                "libcutils"
            ];
        };
        host = {
            static_libs = [
                "libusbhost"
                "libcutils"
            ];

            cflags = ["-O0"];
        };
        darwin = {
            enabled = false;
        };
    };
};

in { inherit accessorychat; }

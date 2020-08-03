{ cc_binary_host }:
let

accessorytest = cc_binary_host {
    name = "accessorytest";

    srcs = [
        "accessory.c"
        "audio.c"
        "hid.c"
        "usb.c"
    ];

    static_libs = [
        "libusbhost"
        "libcutils"
        "libtinyalsa"
    ];
    cflags = [
        "-O0"
        "-Wno-unused-parameter"
        "-Werror"
    ];

    target = {
        darwin = {
            #  Build for Linux host only
            enabled = false;
        };
    };
};

in { inherit accessorytest; }

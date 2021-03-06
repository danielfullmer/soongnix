{ cc_library_shared }:
let

libaudioroute = cc_library_shared {
    name = "libaudioroute";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = ["audio_route.c"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libexpat"
        "libtinyalsa"
    ];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libaudioroute; }

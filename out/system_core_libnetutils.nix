{ cc_binary, cc_library_shared }:
let

libnetutils = cc_library_shared {
    name = "libnetutils";
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    srcs = [
        "checksum.c"
        "dhcpclient.c"
        "dhcpmsg.c"
        "ifc_utils.c"
        "packet.c"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
    ];

    cflags = ["-Werror"];

    export_include_dirs = ["include"];
};

dhcpdbg = cc_binary {
    name = "dhcpdbg";

    srcs = [
        "dhcptool.c"
    ];

    shared_libs = [
        "libnetutils"
    ];

    cflags = ["-Werror"];
};

in { inherit dhcpdbg libnetutils; }

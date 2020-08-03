{ cc_binary }:
let

dnsmasq = cc_binary {
    name = "dnsmasq";
    srcs = [
        "cache.c"
        "dhcp.c"
        "dnsmasq.c"
        "forward.c"
        "helper.c"
        "lease.c"
        "log.c"
        "netlink.c"
        "network.c"
        "option.c"
        "rfc1035.c"
        "rfc2131.c"
        "util.c"
    ];

    cflags = [
        "-O2"
        "-g"
        "-W"
        "-Wall"
        "-D__ANDROID__"
        "-DIPV6"
        "-DNO_SCRIPT"
        "-D_BSD_SOURCE"
        "-Wno-unused-variable"
        "-Wno-unused-parameter"
        "-Werror"
    ];
    system_shared_libs = ["libc"];
    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

in { inherit dnsmasq; }

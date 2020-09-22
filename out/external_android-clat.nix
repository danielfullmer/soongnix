{ cc_binary, cc_defaults, cc_test, filegroup, prebuilt_etc }:
let

clatd_defaults = cc_defaults {
    name = "clatd_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused-parameter"

        #  Bug: http://b/33566695
        "-Wno-address-of-packed-member"
    ];

    #  For MARK_UNSET.
    header_libs = [
        "libnetd_client_headers"
    ];
};

#  Code used both by the daemon and by unit tests.
clatd_common = filegroup {
    name = "clatd_common";
    srcs = [
        "clatd.c"
        "dump.c"
        "getaddr.c"
        "icmp.c"
        "ipv4.c"
        "ipv6.c"
        "logging.c"
        "netlink_callbacks.c"
        "netlink_msg.c"
        "ring.c"
        "setif.c"
        "translate.c"
    ];
};

#  The clat daemon.
clatd = cc_binary {
    name = "clatd";
    defaults = ["clatd_defaults"];
    srcs = [
        ":clatd_common"
        "main.c"
    ];
    static_libs = ["libnl"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libnetutils"
    ];

    #  Only enable clang-tidy for the daemon, not the tests, because enabling it for the
    #  tests substantially increases build/compile cycle times and doesn't really provide a
    #  security benefit.
    tidy = true;
    tidy_checks = [
        "-*"
        "cert-*"
        "clang-analyzer-security*"
        "android-*"
    ];
    tidy_flags = [
        "-warnings-as-errors=clang-analyzer-security*,cert-*,android-*"
    ];
};

#  The configuration file.
"clatd.conf" = prebuilt_etc {
    name = "clatd.conf";
    src = "clatd.conf";
};

#  Unit tests.
clatd_test = cc_test {
    name = "clatd_test";
    defaults = ["clatd_defaults"];
    srcs = [
        ":clatd_common"
        "clatd_test.cpp"
    ];
    static_libs = [
        "libbase"
        "libnetd_test_tun_interface"
        "libnl"
    ];
    shared_libs = [
        "libcutils"
        "liblog"
        "libnetutils"
    ];
    test_suites = ["device-tests"];
    require_root = true;
};

in { inherit "clatd.conf" clatd clatd_common clatd_defaults clatd_test; }

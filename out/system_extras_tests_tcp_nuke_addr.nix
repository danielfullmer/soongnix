{ cc_test }:
let

tcp_nuke_addr_test = cc_test {
    name = "tcp_nuke_addr_test";
    srcs = ["tcp_nuke_addr_test.cpp"];
    cppflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit tcp_nuke_addr_test; }

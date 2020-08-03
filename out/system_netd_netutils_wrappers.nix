{ cc_binary, cc_test }:
let

"netutils-wrapper-1.0" = cc_binary {
    name = "netutils-wrapper-1.0";
    defaults = ["netd_defaults"];
    srcs = [
        "NetUtilsWrapper-1.0.cpp"
        "main.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    symlinks = [
        "iptables-wrapper-1.0"
        "ip6tables-wrapper-1.0"
        "ndc-wrapper-1.0"
        "tc-wrapper-1.0"
        "ip-wrapper-1.0"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

netutils_wrapper_test = cc_test {
    name = "netutils_wrapper_test";
    defaults = ["netd_defaults"];
    srcs = [
        "NetUtilsWrapper-1.0.cpp"
        "NetUtilsWrapperTest-1.0.cpp"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
};

in { inherit "netutils-wrapper-1.0" netutils_wrapper_test; }

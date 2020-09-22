{ cc_library, cc_test }:
let

server_configurable_flags = cc_library {
    name = "server_configurable_flags";
    srcs = ["server_configurable_flags.cc"];
    host_supported = true;
    shared_libs = [
        "libbase"
        "libcutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = ["include"];
    apex_available = [
        "//apex_available:platform"
        "com.android.resolv"
    ];
    min_sdk_version = "29";
};

#  Tests
#  ------------------------------------------------------------------------------
server_configurable_flags_test = cc_test {
    name = "server_configurable_flags_test";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    srcs = [
        "server_configurable_flags_test.cc"
    ];
    shared_libs = [
        "server_configurable_flags"
        "libbase"
    ];
    local_include_dirs = ["."];
    test_suites = ["device-tests"];
};

in { inherit server_configurable_flags server_configurable_flags_test; }

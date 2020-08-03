{ cc_defaults, cc_test }:
let

dns_async_defaults = cc_defaults {
    name = "dns_async_defaults";

    cflags = [
        "-fstack-protector-all"
        "-g"
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wnullable-to-nonnull-conversion"
        "-Wsign-compare"
        "-Wthread-safety"
        "-Wunused-parameter"
    ];
    srcs = [
        "NativeDnsAsyncTest.cpp"
    ];
    shared_libs = [
        "libandroid"
        "liblog"
        "libutils"
    ];
};

CtsNativeNetDnsTestCases = cc_test {
    name = "CtsNativeNetDnsTestCases";
    defaults = ["dns_async_defaults"];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    test_suites = [
        "cts"
        "mts"
    ];
};

in { inherit CtsNativeNetDnsTestCases dns_async_defaults; }

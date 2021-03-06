{ cc_test }:
let

proxy_resolver_v8_unittest = cc_test {
    name = "proxy_resolver_v8_unittest";

    srcs = ["proxy_resolver_v8_unittest.cc"];

    include_dirs = ["external/chromium-libpac/src"];

    cflags = [
        "-Wno-endif-labels"
        "-Wno-import"
        "-Wno-format"
    ];

    #  Use the non-APEX version for C++ API.
    bootstrap = true;

    shared_libs = [
        "libpac"
        "libutils"
        "liblog"
        "libandroid_runtime"
    ];
};

in { inherit proxy_resolver_v8_unittest; }

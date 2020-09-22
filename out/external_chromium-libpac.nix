{ cc_library_shared }:
let

libpac = cc_library_shared {
    name = "libpac";

    srcs = [
        "src/proxy_resolver_v8.cc"
        "src/proxy_resolver_v8_wrapper.cc"
        "src/proxy_resolver_js_bindings.cc"
        "src/net_util.cc"
    ];

    cflags = [
        "-Wno-endif-labels"
        "-Wno-import"
        "-Wno-format"
        "-Wno-unused-parameter"
        "-Werror"
    ];

    export_include_dirs = ["includes"];
    local_include_dirs = ["src"];

    static_libs = ["libv8"];

    shared_libs = [
        "liblog"
        "libicuuc"
        "libicui18n"
    ];

    stubs = {
        symbol_file = "libpac.map.txt";
        versions = [
            "1"
        ];
    };
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
    sanitize = {
        cfi = true;
    };
};

in { inherit libpac; }

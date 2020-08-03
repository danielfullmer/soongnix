{ cc_binary, cc_library_headers, cc_library_static }:
let

llkd_headers = cc_library_headers {
    name = "llkd_headers";

    export_include_dirs = ["include"];
};

libllkd = cc_library_static {
    name = "libllkd";

    srcs = [
        "libllkd.cpp"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];

    export_include_dirs = ["include"];

    cflags = ["-Werror"];

    product_variables = {
        debuggable = {
            cppflags = ["-D__PTRACE_ENABLED__"];
        };
    };
};

llkd = cc_binary {
    name = "llkd";

    srcs = [
        "llkd.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];
    static_libs = [
        "libllkd"
    ];
    cflags = ["-Werror"];

    init_rc = ["llkd.rc"];
    product_variables = {
        debuggable = {
            init_rc = ["llkd-debuggable.rc"];
        };
    };
};

in { inherit libllkd llkd llkd_headers; }

{ cc_library_headers, cc_library_static }:
let

#  ========================================================
#  libasync_safe.a
#  ========================================================
libasync_safe = cc_library_static {
    defaults = ["libc_defaults"];
    srcs = [
        "async_safe_log.cpp"
    ];

    name = "libasync_safe";
    vendor_available = true;
    recovery_available = true;

    include_dirs = ["bionic/libc"];
    header_libs = [
        "libc_headers"
        "liblog_headers"
    ];

    export_include_dirs = ["include"];
    export_header_lib_headers = ["liblog_headers"];
    stl = "none";
};

libasync_safe_headers = cc_library_headers {
    name = "libasync_safe_headers";
    recovery_available = true;
    defaults = ["linux_bionic_supported"];

    export_include_dirs = ["include"];

    system_shared_libs = [];
    stl = "none";
};

in { inherit libasync_safe libasync_safe_headers; }

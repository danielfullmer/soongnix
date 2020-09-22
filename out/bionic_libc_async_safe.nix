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
    native_bridge_supported = true;

    include_dirs = ["bionic/libc"];
    header_libs = [
        "libc_headers"
        "liblog_headers"
    ];

    export_include_dirs = ["include"];
    export_header_lib_headers = ["liblog_headers"];
    stl = "none";

    apex_available = [
        "//apex_available:platform"
        "com.android.runtime"
        "com.android.art.debug"
        "com.android.art.release"
        "com.android.media"
        "com.android.media.swcodec"
    ];
};

libasync_safe_headers = cc_library_headers {
    name = "libasync_safe_headers";
    ramdisk_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    defaults = ["linux_bionic_supported"];

    export_include_dirs = ["include"];

    system_shared_libs = [];
    stl = "none";

    apex_available = [
        "//apex_available:platform"
        "com.android.runtime"
    ];
};

in { inherit libasync_safe libasync_safe_headers; }

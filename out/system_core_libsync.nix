{ cc_defaults, cc_library, cc_test, llndk_library, ndk_headers, ndk_library }:
let

libsync_headers = ndk_headers {
    name = "libsync_headers";
    from = "include/ndk";
    to = "android";
    srcs = ["include/ndk/sync.h"];
    license = "NOTICE";
};

libsync = ndk_library {
    name = "libsync";
    symbol_file = "libsync.map.txt";
    first_version = "26";
};

libsync_defaults = cc_defaults {
    name = "libsync_defaults";
    srcs = ["sync.c"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    cflags = ["-Werror"];
};

libsync = cc_library {
    name = "libsync";
    recovery_available = true;
    defaults = ["libsync_defaults"];
};

libsync = llndk_library {
    name = "libsync";
    symbol_file = "libsync.map.txt";
    export_include_dirs = ["include"];
};

sync-unit-tests = cc_test {
    name = "sync-unit-tests";
    shared_libs = ["libsync"];
    srcs = ["tests/sync_test.cpp"];
    cflags = [
        "-g"
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
    ];
};

in { inherit libsync libsync_defaults libsync_headers sync-unit-tests; }

{ cc_defaults, cc_library, cc_test }:
let



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
    native_bridge_supported = true;
    defaults = ["libsync_defaults"];
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

in { inherit libsync libsync_defaults sync-unit-tests; }

{ cc_library, cc_test }:
let

#  ==============================================================
#  libc_malloc_hooks.so
#  ==============================================================
libc_malloc_hooks = cc_library {
    name = "libc_malloc_hooks";

    srcs = [
        "malloc_hooks.cpp"
    ];

    static_libs = [
        "libasync_safe"
    ];

    multilib = {
        lib32 = {
            version_script = "exported32.map";
        };
        lib64 = {
            version_script = "exported64.map";
        };
    };
    include_dirs = ["bionic/libc"];

    sanitize = {
        never = true;
    };
    native_coverage = false;

    cflags = [
        "-Wall"
        "-Werror"
        "-fno-stack-protector"
    ];

    apex_available = [
        "com.android.runtime"
    ];
    static = {
        apex_available = [
            "//apex_available:platform"
        ];
    };
};

#  ==============================================================
#  Unit Tests
#  ==============================================================
malloc_hooks_system_tests = cc_test {
    name = "malloc_hooks_system_tests";
    isolated = true;

    srcs = [
        "tests/malloc_hooks_tests.cpp"
    ];

    whole_static_libs = ["libc_malloc_hooks"];

    shared_libs = ["libbase"];

    local_include_dirs = ["tests"];
    include_dirs = [
        "bionic/libc"
        "bionic"
    ];
    header_libs = [
        "bionic_libc_platform_headers"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    test_suites = ["general-tests"];
};

in { inherit libc_malloc_hooks malloc_hooks_system_tests; }

{ cc_library, cc_library_static, cc_test }:
let

#  ==============================================================
#  libc_malloc_debug_backtrace.a
#  ==============================================================
#  Used by libmemunreachable
libc_malloc_debug_backtrace = cc_library_static {
    name = "libc_malloc_debug_backtrace";
    vendor_available = true;

    srcs = [
        "backtrace.cpp"
        "MapData.cpp"
    ];

    stl = "libc++_static";

    whole_static_libs = [
        "libbase"
        "libasync_safe"
    ];

    include_dirs = ["bionic/libc"];

    export_include_dirs = ["."];

    sanitize = {
        never = true;
    };
    native_coverage = false;

    target = {
        android = {
            static_libs = ["libc++demangle"];
        };
    };

    #  -Wno-error=format-zero-length needed for gcc to compile.
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=format-zero-length"
    ];

    apex_available = [
        "//apex_available:platform"
        "com.android.runtime"
    ];
};

#  ==============================================================
#  libc_malloc_debug.so
#  ==============================================================
libc_malloc_debug = cc_library {
    name = "libc_malloc_debug";

    srcs = [
        "Config.cpp"
        "DebugData.cpp"
        "debug_disable.cpp"
        "GuardData.cpp"
        "malloc_debug.cpp"
        "PointerData.cpp"
        "RecordData.cpp"
        "UnwindBacktrace.cpp"
    ];

    stl = "libc++_static";

    static_libs = [
        "libasync_safe"
        "libbase"
        "libc_malloc_debug_backtrace"
    ];

    shared_libs = [
        "libunwindstack"
    ];

    multilib = {
        lib32 = {
            version_script = "exported32.map";
        };
        lib64 = {
            version_script = "exported64.map";
        };
    };
    allow_undefined_symbols = true;
    include_dirs = ["bionic/libc"];

    sanitize = {
        never = true;
    };
    native_coverage = false;

    #  -Wno-error=format-zero-length needed for gcc to compile.
    cflags = [
        "-Wall"
        "-Werror"
        "-fno-stack-protector"
        "-Wno-error=format-zero-length"
        "-Wthread-safety"
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
malloc_debug_unit_tests = cc_test {
    name = "malloc_debug_unit_tests";

    srcs = [
        "tests/backtrace_fake.cpp"
        "tests/log_fake.cpp"
        "tests/libc_fake.cpp"
        "tests/malloc_debug_config_tests.cpp"
        "tests/malloc_debug_unit_tests.cpp"
    ];

    local_include_dirs = ["tests"];
    include_dirs = [
        "bionic/libc"
        "bionic/libc/async_safe/include"
    ];

    header_libs = [
        "bionic_libc_platform_headers"
    ];

    static_libs = [
        "libc_malloc_debug"
        "libtinyxml2"
    ];

    shared_libs = [
        "libbase"
        "libunwindstack"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=format-zero-length"
        "-O0"
    ];
};

#  ==============================================================
#  System Tests
#  ==============================================================
malloc_debug_system_tests = cc_test {
    name = "malloc_debug_system_tests";
    isolated = true;

    include_dirs = [
        "bionic/libc"
    ];

    header_libs = [
        "bionic_libc_platform_headers"
    ];

    srcs = [
        "tests/malloc_debug_system_tests.cpp"
    ];

    shared_libs = [
        "libbase"
        "libbacktrace"
        "liblog"
        "libunwindstack"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-O0"
    ];
    test_suites = ["general-tests"];
};

in { inherit libc_malloc_debug libc_malloc_debug_backtrace malloc_debug_system_tests malloc_debug_unit_tests; }

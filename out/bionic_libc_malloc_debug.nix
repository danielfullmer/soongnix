{ cc_library, cc_library_static, cc_test }:
let

#  ==============================================================
#  libc_malloc_debug_backtrace.a
#  ==============================================================
#  Used by libmemunreachable
libc_malloc_debug_backtrace = cc_library_static {

    name = "libc_malloc_debug_backtrace";

    srcs = [
        "backtrace.cpp"
        "MapData.cpp"
    ];

    stl = "libc++_static";

    whole_static_libs = [
        "libbase"
        "libasync_safe"
        "libdemangle"
    ];

    include_dirs = ["bionic/libc"];

    export_include_dirs = ["."];

    sanitize = {
        never = true;
    };
    native_coverage = false;

    #  -Wno-error=format-zero-length needed for gcc to compile.
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=format-zero-length"
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

    #  Only need this for arm since libc++ uses its own unwind code that
    #  doesn't mix with the other default unwind code.
    arch = {
        arm = {
            static_libs = ["libunwind_llvm"];
        };
    };

    static_libs = [
        "libasync_safe"
        "libbase"
        "libdemangle"
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

    static_libs = [
        "libc_malloc_debug"
        "libdemangle"
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

    include_dirs = ["bionic/libc"];

    srcs = [
        "tests/malloc_debug_system_tests.cpp"
    ];

    shared_libs = [
        "libbase"
        "liblog"
        "libunwindstack"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-O0"
    ];
};

in { inherit libc_malloc_debug libc_malloc_debug_backtrace malloc_debug_system_tests malloc_debug_unit_tests; }

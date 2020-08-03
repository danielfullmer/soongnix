{ cc_defaults, cc_library, cc_test }:
let

libmemunreachable_defaults = cc_defaults {
    name = "libmemunreachable_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
    ];

    target = {
        android = {
            static_libs = ["libasync_safe"];
        };
        host = {
            shared_libs = ["liblog"];
        };
    };
};

libmemunreachable = cc_library {
    name = "libmemunreachable";
    defaults = ["libmemunreachable_defaults"];
    srcs = [
        "Allocator.cpp"
        "Binder.cpp"
        "HeapWalker.cpp"
        "LeakFolding.cpp"
        "LeakPipe.cpp"
        "MemUnreachable.cpp"
        "ProcessMappings.cpp"
        "PtracerThread.cpp"
        "ThreadCapture.cpp"
    ];

    static_libs = [
        "libc_malloc_debug_backtrace"
        "libprocinfo"
    ];
    #  Only need this for arm since libc++ uses its own unwind code that
    #  doesn't mix with the other default unwind code.
    arch = {
        arm = {
            static_libs = ["libunwind_llvm"];
        };
    };
    export_include_dirs = ["include"];
    local_include_dirs = ["include"];
};

memunreachable_test = cc_test {
    name = "memunreachable_test";
    defaults = ["libmemunreachable_defaults"];
    host_supported = true;
    srcs = [
        "tests/Allocator_test.cpp"
        "tests/HeapWalker_test.cpp"
        "tests/LeakFolding_test.cpp"
    ];

    target = {
        android = {
            srcs = [
                "tests/DisableMalloc_test.cpp"
                "tests/MemUnreachable_test.cpp"
                "tests/ThreadCapture_test.cpp"
            ];
            shared_libs = [
                "libmemunreachable"
            ];
        };
        host = {
            srcs = [
                "Allocator.cpp"
                "HeapWalker.cpp"
                "LeakFolding.cpp"
                "tests/HostMallocStub.cpp"
            ];
        };
        darwin = {
            enabled = false;
        };
    };

    test_suites = ["device-tests"];
};

memunreachable_binder_test = cc_test {
    name = "memunreachable_binder_test";
    defaults = ["libmemunreachable_defaults"];
    srcs = [
        "tests/Binder_test.cpp"
    ];
    static_libs = ["libmemunreachable"];
    shared_libs = [
        "libbinder"
        "libhidlbase"
        "libutils"
    ];
    test_suites = ["device-tests"];
};

in { inherit libmemunreachable libmemunreachable_defaults memunreachable_binder_test memunreachable_test; }

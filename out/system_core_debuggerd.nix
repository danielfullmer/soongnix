{ cc_benchmark, cc_binary, cc_defaults, cc_library, cc_library_headers, cc_library_shared, cc_library_static, cc_test }:
let

debuggerd_defaults = cc_defaults {
    name = "debuggerd_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-argument"
        "-Wno-unused-function"
        "-Wno-nullability-completeness"
        "-Os"
    ];

    local_include_dirs = ["include"];
};

libdebuggerd_common_headers = cc_library_headers {
    name = "libdebuggerd_common_headers";
    export_include_dirs = ["common/include"];
    recovery_available = true;
};

libtombstoned_client = cc_library_shared {
    name = "libtombstoned_client";
    defaults = ["debuggerd_defaults"];
    srcs = [
        "tombstoned/tombstoned_client.cpp"
        "util.cpp"
    ];

    header_libs = ["libdebuggerd_common_headers"];

    static_libs = [
        "libasync_safe"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
    ];

    export_header_lib_headers = ["libdebuggerd_common_headers"];
    export_include_dirs = ["tombstoned/include"];
};

#  Utility library to talk to tombstoned and get an output fd.
libtombstoned_client_static = cc_library_static {
    name = "libtombstoned_client_static";
    defaults = ["debuggerd_defaults"];
    recovery_available = true;
    srcs = [
        "tombstoned/tombstoned_client.cpp"
        "util.cpp"
    ];

    header_libs = ["libdebuggerd_common_headers"];

    whole_static_libs = [
        "libasync_safe"
        "libcutils"
        "libbase"
    ];

    export_header_lib_headers = ["libdebuggerd_common_headers"];
    export_include_dirs = ["tombstoned/include"];
};

#  Core implementation, linked into libdebuggerd_handler and the dynamic linker.
libdebuggerd_handler_core = cc_library_static {
    name = "libdebuggerd_handler_core";
    defaults = ["debuggerd_defaults"];
    recovery_available = true;
    srcs = ["handler/debuggerd_handler.cpp"];

    header_libs = [
        "libbase_headers"
        "libdebuggerd_common_headers"
    ];

    whole_static_libs = [
        "libasync_safe"
        "libcutils"
        "libdebuggerd"
    ];

    export_header_lib_headers = ["libdebuggerd_common_headers"];
    export_include_dirs = ["include"];
};

#  Implementation with a no-op fallback.
libdebuggerd_handler = cc_library_static {
    name = "libdebuggerd_handler";
    defaults = ["debuggerd_defaults"];
    srcs = ["handler/debuggerd_fallback_nop.cpp"];

    whole_static_libs = [
        "libdebuggerd_handler_core"
    ];

    export_include_dirs = ["include"];
};

#  Fallback implementation.
libdebuggerd_handler_fallback = cc_library_static {
    name = "libdebuggerd_handler_fallback";
    defaults = ["debuggerd_defaults"];
    recovery_available = true;
    srcs = [
        "handler/debuggerd_fallback.cpp"
    ];

    whole_static_libs = [
        "libdebuggerd_handler_core"
        "libtombstoned_client_static"
        "libasync_safe"
        "libbase"
        "libdebuggerd"
        "libunwindstack"
        "libdexfile_support_static" #  libunwindstack dependency
        "liblzma"
        "libcutils"
    ];
    target = {
        recovery = {
            exclude_static_libs = [
                "libdexfile_support_static"
            ];
        };
    };

    export_include_dirs = ["include"];
};

libdebuggerd_client = cc_library {
    name = "libdebuggerd_client";
    defaults = ["debuggerd_defaults"];
    srcs = [
        "client/debuggerd_client.cpp"
        "util.cpp"
    ];

    header_libs = ["libdebuggerd_common_headers"];

    shared_libs = [
        "libbase"
        "libcutils"
        "libprocinfo"
    ];

    export_header_lib_headers = ["libdebuggerd_common_headers"];
    export_include_dirs = ["include"];
};

libdebuggerd = cc_library_static {
    name = "libdebuggerd";
    defaults = ["debuggerd_defaults"];
    recovery_available = true;

    srcs = [
        "libdebuggerd/backtrace.cpp"
        "libdebuggerd/open_files_list.cpp"
        "libdebuggerd/tombstone.cpp"
        "libdebuggerd/utility.cpp"
    ];

    local_include_dirs = ["libdebuggerd/include"];
    export_include_dirs = ["libdebuggerd/include"];

    #  Needed for private/bionic_fdsan.h
    include_dirs = ["bionic/libc"];

    static_libs = [
        "libdexfile_support_static" #  libunwindstack dependency
        "libunwindstack"
        "liblzma"
        "libbase"
        "libcutils"
        "liblog"
    ];
    target = {
        recovery = {
            exclude_static_libs = [
                "libdexfile_support_static"
            ];
        };
    };

    product_variables = {
        debuggable = {
            cflags = ["-DROOT_POSSIBLE"];
        };
    };
};

debuggerd_test = cc_test {
    name = "debuggerd_test";
    defaults = ["debuggerd_defaults"];

    cflags = ["-Wno-missing-field-initializers"];
    srcs = [
        "libdebuggerd/test/dump_memory_test.cpp"
        "libdebuggerd/test/elf_fake.cpp"
        "libdebuggerd/test/log_fake.cpp"
        "libdebuggerd/test/open_files_list_test.cpp"
        "libdebuggerd/test/tombstone_test.cpp"
    ];

    target = {
        android = {
            srcs = [
                "client/debuggerd_client_test.cpp"
                "debuggerd_test.cpp"
            ];
            static_libs = [
                "libasync_safe"
                "libtombstoned_client_static"
            ];
        };
    };

    shared_libs = [
        "libbase"
        "libcutils"
        "libdebuggerd_client"
        "liblog"
        "libminijail"
        "libnativehelper"
        "libunwindstack"
    ];

    static_libs = [
        "libdebuggerd"
    ];

    local_include_dirs = [
        "libdebuggerd"
    ];

    compile_multilib = "both";
    multilib = {
        lib32 = {
            stem = "debuggerd_test32";
        };
        lib64 = {
            stem = "debuggerd_test64";
        };
    };

    test_suites = ["device-tests"];
};

debuggerd_benchmark = cc_benchmark {
    name = "debuggerd_benchmark";
    defaults = ["debuggerd_defaults"];
    srcs = ["debuggerd_benchmark.cpp"];
    shared_libs = [
        "libbase"
        "libdebuggerd_client"
    ];
};

crash_dump = cc_binary {
    name = "crash_dump";
    srcs = [
        "crash_dump.cpp"
        "util.cpp"
    ];
    defaults = ["debuggerd_defaults"];

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    static_libs = [
        "libtombstoned_client_static"
        "libdebuggerd"
        "libcutils"
    ];

    shared_libs = [
        "libbase"
        "liblog"
        "libprocinfo"
        "libunwindstack"
    ];
};

debuggerd = cc_binary {
    name = "debuggerd";
    srcs = [
        "debuggerd.cpp"
    ];
    defaults = ["debuggerd_defaults"];

    shared_libs = [
        "libbase"
        "libdebuggerd_client"
        "liblog"
        "libprocinfo"
    ];

    local_include_dirs = ["include"];
};

tombstoned = cc_binary {
    name = "tombstoned";
    srcs = [
        "util.cpp"
        "tombstoned/intercept_manager.cpp"
        "tombstoned/tombstoned.cpp"
    ];
    defaults = ["debuggerd_defaults"];

    header_libs = ["libdebuggerd_common_headers"];

    static_libs = [
        "libbase"
        "libcutils"
        "libevent"
        "liblog"
    ];

    init_rc = ["tombstoned/tombstoned.rc"];
};

subdirs = [
    "crasher"
];

in { inherit crash_dump debuggerd debuggerd_benchmark debuggerd_defaults debuggerd_test libdebuggerd libdebuggerd_client libdebuggerd_common_headers libdebuggerd_handler libdebuggerd_handler_core libdebuggerd_handler_fallback libtombstoned_client libtombstoned_client_static tombstoned; }

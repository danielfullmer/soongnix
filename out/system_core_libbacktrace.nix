{ cc_benchmark, cc_defaults, cc_library, cc_library_headers, cc_test, cc_test_library }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

libbacktrace_common = cc_defaults {
    name = "libbacktrace_common";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

libbacktrace_sources = [
    "Backtrace.cpp"
    "BacktraceCurrent.cpp"
    "BacktracePtrace.cpp"
    "ThreadEntry.cpp"
    "UnwindStack.cpp"
    "UnwindStackMap.cpp"
];

libbacktrace_headers = cc_library_headers {
    name = "libbacktrace_headers";
    vendor_available = true;
    recovery_available = true;
    export_include_dirs = ["include"];
};

libbacktrace = cc_library {
    name = "libbacktrace";
    vendor_available = false;
    recovery_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    defaults = ["libbacktrace_common"];
    host_supported = true;

    cflags = [
        "-Wexit-time-destructors"
    ];

    srcs = [
        "BacktraceMap.cpp"
    ];

    export_include_dirs = ["include"];

    target = {
        darwin = {
            enabled = true;
            shared_libs = [
                "libbase"
            ];
        };
        linux = {
            srcs = libbacktrace_sources;

            shared_libs = [
                "libbase"
                "liblog"
                "libunwindstack"
            ];

            static_libs = [
                "libprocinfo"
            ];
        };
        android = {
            static_libs = ["libasync_safe"];
        };
        vendor = {
            cflags = ["-DNO_LIBDEXFILE_SUPPORT"];
        };
        recovery = {
            cflags = ["-DNO_LIBDEXFILE_SUPPORT"];
        };
    };
    whole_static_libs = ["libdemangle"];
};

libbacktrace_test = cc_test_library {
    name = "libbacktrace_test";
    defaults = ["libbacktrace_common"];
    host_supported = true;
    strip = {
        none = true;
    };
    cflags = ["-O0"];
    srcs = ["backtrace_testlib.cpp"];

    shared_libs = [
        "libunwindstack"
    ];
    relative_install_path = "backtrace_test_libs";

    target = {
        linux_glibc = {
            #  This forces the creation of eh_frame with unwind information
            #  for host.
            cflags = [
                "-fcxx-exceptions"
            ];
        };
    };
};

# -------------------------------------------------------------------------
#  The backtrace_test executable.
# -------------------------------------------------------------------------
backtrace_test = cc_test {
    name = "backtrace_test";
    isolated = true;
    defaults = ["libbacktrace_common"];
    host_supported = true;
    srcs = [
        "backtrace_offline_test.cpp"
        "backtrace_test.cpp"
    ];

    cflags = [
        "-fno-builtin"
        "-O0"
        "-g"
    ];

    shared_libs = [
        "libbacktrace"
        "libbase"
        "liblog"
        "libunwindstack"
    ];

    group_static_libs = true;

    #  So that the dlopen can find the libbacktrace_test.so.
    ldflags = [
        "-Wl,--rpath,\${ORIGIN}/../backtrace_test_libs"
    ];

    test_suites = ["device-tests"];
    data = [
        "testdata/arm/libGLESv2_adreno.so"
        "testdata/arm/libandroid_runtime.so"
        "testdata/arm/libart.so"
        "testdata/arm/libbacktrace_test_arm_exidx.so"
        "testdata/arm/libbacktrace_test_debug_frame.so"
        "testdata/arm/libbacktrace_test_gnu_debugdata.so"
        "testdata/arm/offline_testdata"
        "testdata/arm/offline_testdata_for_libGLESv2_adreno"
        "testdata/arm/offline_testdata_for_libandroid_runtime"
        "testdata/arm/offline_testdata_for_libart"
        "testdata/arm64/eglSubDriverAndroid.so"
        "testdata/arm64/libbacktrace_test_eh_frame.so"
        "testdata/arm64/libskia.so"
        "testdata/arm64/offline_testdata"
        "testdata/arm64/offline_testdata_for_eglSubDriverAndroid"
        "testdata/arm64/offline_testdata_for_libskia"
        "testdata/x86/libbacktrace_test_debug_frame.so"
        "testdata/x86/libbacktrace_test_gnu_debugdata.so"
        "testdata/x86/offline_testdata"
        "testdata/x86_64/libbacktrace_test_eh_frame.so"
        "testdata/x86_64/offline_testdata"
    ];
    required = [
        "libbacktrace_test"
    ];
};

backtrace_benchmarks = cc_benchmark {
    name = "backtrace_benchmarks";
    defaults = ["libbacktrace_common"];

    srcs = [
        "backtrace_benchmarks.cpp"
        "backtrace_read_benchmarks.cpp"
    ];

    shared_libs = [
        "libbacktrace"
        "libbase"
        "libunwindstack"
    ];
};

in { inherit backtrace_benchmarks backtrace_test libbacktrace libbacktrace_common libbacktrace_headers libbacktrace_test; }

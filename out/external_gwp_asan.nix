{ cc_defaults, cc_fuzz, cc_library, cc_library_headers, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

gwp_asan_defaults = cc_defaults {
    name = "gwp_asan_defaults";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    native_bridge_supported = true;
    ramdisk_available = true;

    #  GWP-ASan currently has no support for darwin.
    target = {
        darwin = {
            enabled = false;
        };
    };
};

gwp_asan_no_libs_defaults = cc_defaults {
    name = "gwp_asan_no_libs_defaults";
    defaults = ["gwp_asan_defaults"];

    #  GWP-ASan is used by bionic libc, and should have no libc/libc++
    #  dependencies.
    system_shared_libs = [];
    stl = "none";
};

gwp_asan_headers = cc_library_headers {
    name = "gwp_asan_headers";
    defaults = [
        "gwp_asan_defaults"
        "gwp_asan_no_libs_defaults"
    ];
    export_include_dirs = [
        "."
    ];
    apex_available = [
        #  This header lib is compiled also as part of the platform due to libasync_safe
        #  and others that are compiled with this header and are statically included
        #  in the platform side.
        "//apex_available:platform"
        "com.android.runtime"
        #  GWP-ASan headers are currently referenced by the following additional APEXes
        "com.android.art.debug"
        "com.android.art.release"
        "com.android.media"
        "com.android.media.swcodec"
    ];
};

#  Only static linkage is provided for performance reasons.
gwp_asan = cc_library_static {
    name = "gwp_asan";
    defaults = ["gwp_asan_no_libs_defaults"];
    header_libs = [
        "gwp_asan_headers"
        "libc_headers" #  Required for pthread.h in mutex.h.
    ];
    srcs = [
        "gwp_asan/common.cpp"
        "gwp_asan/guarded_pool_allocator.cpp"
        "gwp_asan/platform_specific/common_posix.cpp"
        "gwp_asan/platform_specific/guarded_pool_allocator_posix.cpp"
        "gwp_asan/platform_specific/mutex_posix.cpp"
        "gwp_asan/platform_specific/utilities_posix.cpp"
        "gwp_asan/random.cpp"
        "gwp_asan/stack_trace_compressor.cpp"
    ];
    #  GWP-ASan requires platform (non-emulated) TLS. We use thread local
    #  variables in the core, inlined interface to GWP-ASan.
    cflags = [
        "-fno-emulated-tls"
    ];
    apex_available = [
        #  Required to not occlude the default platform variation from being
        #  skipped by the apex mutator. If this happens - the license file for
        #  the static GWP-ASan library won't be generated, and you'll get errors
        #  at build time.
        "//apex_available:platform"

        "com.android.runtime" #  GWP-ASan is used in libc.
        "com.android.media.swcodec" #  libc_scudo (from media) uses GWP-ASan.
    ];
};

#  GWP-ASan crash handler API. Provides all the tools you need to symbolize a
#  GWP-ASan crash.
gwp_asan_crash_handler = cc_library {
    name = "gwp_asan_crash_handler";
    defaults = ["gwp_asan_defaults"];
    header_libs = [
        "gwp_asan_headers"
        "libc_headers" #  Required for assert.h
    ];
    srcs = [
        "gwp_asan/common.cpp"
        "gwp_asan/crash_handler.cpp"
        "gwp_asan/platform_specific/common_posix.cpp"
        "gwp_asan/platform_specific/utilities_posix.cpp"
        "gwp_asan/stack_trace_compressor.cpp"
    ];
    apex_available = [
        "//apex_available:platform"
        "com.android.runtime"
    ];
};

stack_trace_compressor_fuzzer = cc_fuzz {
    name = "stack_trace_compressor_fuzzer";
    host_supported = true;
    srcs = ["tools/stack_trace_compressor_fuzzer.cpp"];
    static_libs = ["gwp_asan"];
};

#  These unit tests are also continuously run upstream in LLVM's buildbots.
gwp_asan_unittest = cc_test {
    name = "gwp_asan_unittest";
    defaults = ["linux_bionic_supported"];
    static_libs = [
        "gwp_asan"
        "gwp_asan_crash_handler"
        "libasync_safe"
        "liblog"
        "libunwindstack"
        "liblzma" #  Dependency from libunwindstack.
    ];

    ldflags = [
        #  Ensure that ICF doesn't clobber DeallocateMemory2 into
        #  DeallocateMemory in tests/backtrace.cpp. This is done in the linker,
        #  so `optnone` in the function declaration doesn't help.
        "-Wl,--icf=none"
    ];
    srcs = [
        "android/test_backtrace.cpp"
        "android/test_printf.cpp"
        "gwp_asan/optional/segv_handler_posix.cpp"
        "gwp_asan/tests/alignment.cpp"
        "gwp_asan/tests/backtrace.cpp"
        "gwp_asan/tests/basic.cpp"
        "gwp_asan/tests/compression.cpp"
        "gwp_asan/tests/crash_handler_api.cpp"
        "gwp_asan/tests/enable_disable.cpp"
        "gwp_asan/tests/harness.cpp"
        "gwp_asan/tests/iterate.cpp"
        "gwp_asan/tests/late_init.cpp"
        "gwp_asan/tests/mutex_test.cpp"
        "gwp_asan/tests/slot_reuse.cpp"
        "gwp_asan/tests/thread_contention.cpp"
    ];
    include_dirs = ["bionic/libc/async_safe/include"];
    test_suites = ["general-tests"];
    cflags = [
        #  GWP-ASan requires anything that uses GuardedPoolAllocator headers to
        #  use platform (ELF) TLS.
        "-fno-emulated-tls"

        #  Ensure that the helper functions in test/backtrace.cpp don't get
        #  tail-call optimised, as this breaks the unwind chain.
        "-fno-optimize-sibling-calls"

        #  The experimental pass manager seems to kill __attribute__((optnone)),
        #  and so we disable it (as we rely on optnone for tests/backtrace.cpp).
        "-fno-experimental-new-pass-manager"
    ];

    #  Late initialisation tests should run isolated, as the platform IE TLS
    #  PRNG should be initialised to its default state.
    isolated = true;
};

in { inherit gwp_asan gwp_asan_crash_handler gwp_asan_defaults gwp_asan_headers gwp_asan_no_libs_defaults gwp_asan_unittest stack_trace_compressor_fuzzer; }
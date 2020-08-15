{ cc_library_host_static, cc_test_host }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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
#

tsan_rtl_cflags = [
    "-Wall"
    "-Werror"
];

tsan_rtl_cppflags = [
    "-std=c++11"
    "-Wno-unused-parameter"
    "-Wno-non-virtual-dtor"
    "-fno-rtti"
    "-fno-builtin"
];

libtsan = cc_library_host_static {
    name = "libtsan";

    include_dirs = ["external/compiler-rt/lib"];
    cflags = tsan_rtl_cflags;
    cppflags = tsan_rtl_cppflags;
    srcs = [
        "rtl/tsan_clock.cc"
        "rtl/tsan_debugging.cc"
        "rtl/tsan_fd.cc"
        "rtl/tsan_flags.cc"
        "rtl/tsan_ignoreset.cc"
        "rtl/tsan_interceptors.cc"
        "rtl/tsan_interceptors_mac.cc"
        "rtl/tsan_interface.cc"
        "rtl/tsan_interface_ann.cc"
        "rtl/tsan_interface_atomic.cc"
        "rtl/tsan_interface_java.cc"
        "rtl/tsan_libdispatch_mac.cc"
        "rtl/tsan_malloc_mac.cc"
        "rtl/tsan_md5.cc"
        "rtl/tsan_mman.cc"
        "rtl/tsan_mutex.cc"
        "rtl/tsan_mutexset.cc"
        "rtl/tsan_new_delete.cc"
        "rtl/tsan_platform_linux.cc"
        "rtl/tsan_platform_mac.cc"
        "rtl/tsan_platform_posix.cc"
        "rtl/tsan_platform_windows.cc"
        "rtl/tsan_preinit.cc"
        "rtl/tsan_report.cc"
        "rtl/tsan_rtl.cc"
        "rtl/tsan_rtl_mutex.cc"
        "rtl/tsan_rtl_proc.cc"
        "rtl/tsan_rtl_report.cc"
        "rtl/tsan_rtl_thread.cc"
        "rtl/tsan_stack_trace.cc"
        "rtl/tsan_stat.cc"
        "rtl/tsan_suppressions.cc"
        "rtl/tsan_symbolize.cc"
        "rtl/tsan_sync.cc"
        "rtl/tsan_rtl_amd64.S"
    ];
    stl = "none";
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    whole_static_libs = [
        "libinterception"
        "libsan"
        "libubsan"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libtsan_cxx = cc_library_host_static {
    name = "libtsan_cxx";

    include_dirs = ["external/compiler-rt/lib"];
    cflags = tsan_rtl_cflags;
    cppflags = tsan_rtl_cppflags;
    srcs = ["rtl/tsan_new_delete.cc"];
    stl = "none";
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    whole_static_libs = ["libubsan_cxx"];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libtsan_unit_test = cc_test_host {
    name = "libtsan_unit_test";

    include_dirs = ["external/compiler-rt/lib"];
    local_include_dirs = ["rtl"];
    cflags = tsan_rtl_cflags;
    cppflags = tsan_rtl_cppflags;
    srcs = [
        "tests/unit/tsan_clock_test.cc"
        "tests/unit/tsan_dense_alloc_test.cc"
        "tests/unit/tsan_flags_test.cc"
        "tests/unit/tsan_mman_test.cc"
        "tests/unit/tsan_mutex_test.cc"
        "tests/unit/tsan_mutexset_test.cc"
        "tests/unit/tsan_shadow_test.cc"
        "tests/unit/tsan_stack_test.cc"
        "tests/unit/tsan_sync_test.cc"
        "tests/unit/tsan_unit_test_main.cc"
        "tests/unit/tsan_vector_test.cc"
    ];
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    static_libs = [
        "libtsan"
        "libubsan"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libtsan_rtl_test = cc_test_host {
    name = "libtsan_rtl_test";

    include_dirs = ["external/compiler-rt/lib"];
    local_include_dirs = ["rtl"];
    cflags = tsan_rtl_cflags;
    cppflags = tsan_rtl_cppflags;
    srcs = [
        "tests/rtl/tsan_bench.cc"
        "tests/rtl/tsan_mop.cc"
        "tests/rtl/tsan_mutex.cc"
        "tests/rtl/tsan_posix.cc"
        "tests/rtl/tsan_string.cc"
        "tests/rtl/tsan_test_util_posix.cc"
        "tests/rtl/tsan_test.cc"
        "tests/rtl/tsan_thread.cc"
    ];
    sanitize = {
        never = true;
    };
    compile_multilib = "64";
    static_libs = [
        "libtsan"
        "libubsan"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libtsan libtsan_cxx libtsan_rtl_test libtsan_unit_test; }

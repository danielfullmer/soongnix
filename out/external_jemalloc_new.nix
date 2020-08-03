{ cc_defaults, cc_library, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

common_cflags = [
    "-D_GNU_SOURCE"
    "-D_REENTRANT"
    "-Wall"
    "-Wshorten-64-to-32"
    "-Wsign-compare"
    "-Wundef"
    "-Wno-format-zero-length"
    "-pipe"
    "-g3"
    "-fvisibility=hidden"
    "-O3"
    "-funroll-loops"

    #  The following flags are for avoiding errors when compiling.
    "-Wno-unused-parameter"
    "-Wno-unused-function"
    "-Wno-missing-field-initializers"

    "-U_FORTIFY_SOURCE"
];

common_c_local_includes = [
    "src"
    "include"
];

#  These parameters change the way jemalloc works.
#    ANDROID_NUM_ARENAS=XX
#      The total number of arenas to create.
#    ANDROID_TCACHE_NSLOTS_SMALL_MIN=XX
#      The minimum number of small slots held in the tcache. This must be
#      at least 1.
#    ANDROID_TCACHE_NSLOTS_SMALL_MAX=XX
#      The number of small slots held in the tcache. The higher this number
#      is, the higher amount of PSS consumed. If this number is set too low
#      then small allocations will take longer to complete.
#    ANDROID_TCACHE_NSLOTS_LARGE=XX
#      The number of large slots held in the tcache. The higher this number
#      is, the higher amount of PSS consumed. If this number is set too low
#      then large allocations will take longer to complete.
#    ANDROID_LG_TCACHE_MAXCLASS_DEFAULT=XX
#      1 << XX is the maximum sized allocation that will be in the tcache.

android_common_cflags = [
    #  Default some parameters to small values to minimize PSS.
    #  These parameters will be overridden by android_product_variables
    #  for non-svelte configs.
    "-DANDROID_NUM_ARENAS=1"
    #  This value cannot go below 2.
    "-DANDROID_TCACHE_NSLOTS_SMALL_MAX=2"
    "-DANDROID_TCACHE_NSLOTS_LARGE=1"
];

android_product_variables = {
    #  Only enable the tcache on non-svelte configurations, to save PSS.
    malloc_not_svelte = {
        cflags = [
            "-DANDROID_ENABLE_TCACHE"
            "-DANDROID_LG_TCACHE_MAXCLASS_DEFAULT=16"

            "-UANDROID_NUM_ARENAS"
            "-DANDROID_NUM_ARENAS=2"

            "-UANDROID_TCACHE_NSLOTS_SMALL_MAX"
            "-DANDROID_TCACHE_NSLOTS_SMALL_MAX=8"

            "-UANDROID_TCACHE_NSLOTS_LARGE"
            "-DANDROID_TCACHE_NSLOTS_LARGE=16"
        ];
    };
};

jemalloc5_defaults = cc_defaults {
    name = "jemalloc5_defaults";
    defaults = ["linux_bionic_supported"];
    host_supported = true;
    cflags = common_cflags;

    target = {
        android = {
            cflags = android_common_cflags;
            product_variables = android_product_variables;
        };
        linux_glibc = {
            enabled = true;
        };
    };

    local_include_dirs = common_c_local_includes;
    stl = "none";
};

lib_src_files = [
    "src/jemalloc.c"
    "src/arena.c"
    "src/background_thread.c"
    "src/base.c"
    "src/bin.c"
    "src/bitmap.c"
    "src/ckh.c"
    "src/ctl.c"
    "src/div.c"
    "src/extent.c"
    "src/extent_dss.c"
    "src/extent_mmap.c"
    "src/hash.c"
    "src/hooks.c"
    "src/large.c"
    "src/log.c"
    "src/malloc_io.c"
    "src/mutex.c"
    "src/mutex_pool.c"
    "src/nstime.c"
    "src/pages.c"
    "src/prng.c"
    "src/prof.c"
    "src/rtree.c"
    "src/stats.c"
    "src/sz.c"
    "src/tcache.c"
    "src/ticker.c"
    "src/tsd.c"
    "src/witness.c"
];

# -----------------------------------------------------------------------
#  jemalloc static library
# -----------------------------------------------------------------------
libjemalloc5 = cc_library {
    name = "libjemalloc5";
    recovery_available = true;

    defaults = ["jemalloc5_defaults"];

    srcs = lib_src_files;

    target = {
        android = {
            shared = {
                enabled = false;
            };
            system_shared_libs = [];
        };
        linux_bionic = {
            system_shared_libs = [];
        };
    };
};

# -----------------------------------------------------------------------
#  jemalloc static jet library
# -----------------------------------------------------------------------
libjemalloc5_jet = cc_library_static {
    name = "libjemalloc5_jet";

    defaults = ["jemalloc5_defaults"];

    cflags = [
        "-DJEMALLOC_JET"
    ];

    srcs = lib_src_files;
};

jemalloc5_testlib_srcs = [
    "test/src/btalloc.c"
    "test/src/btalloc_0.c"
    "test/src/btalloc_1.c"
    "test/src/math.c"
    "test/src/mtx.c"
    "test/src/mq.c"
    "test/src/SFMT.c"
    "test/src/test.c"
    "test/src/thd.c"
    "test/src/timer.c"
];

# -----------------------------------------------------------------------
#  jemalloc unit test library
# -----------------------------------------------------------------------
libjemalloc5_unittest = cc_library_static {
    name = "libjemalloc5_unittest";

    defaults = ["jemalloc5_defaults"];

    cflags = [
        "-DJEMALLOC_UNIT_TEST"
    ];

    local_include_dirs = [
        "test/include"
    ];

    srcs = jemalloc5_testlib_srcs;

    whole_static_libs = ["libjemalloc5_jet"];
};

# -----------------------------------------------------------------------
#  jemalloc unit tests
# -----------------------------------------------------------------------
unit_tests = [
    "test/unit/a0.c"
    "test/unit/arena_reset.c"
    "test/unit/atomic.c"
    "test/unit/background_thread.c"
    "test/unit/background_thread_enable.c"
    "test/unit/base.c"
    "test/unit/bitmap.c"
    "test/unit/ckh.c"
    "test/unit/decay.c"
    "test/unit/div.c"
    "test/unit/emitter.c"
    "test/unit/extent_quantize.c"
    "test/unit/fork.c"
    "test/unit/hash.c"
    "test/unit/hooks.c"
    "test/unit/junk.c"
    "test/unit/junk_alloc.c"
    "test/unit/junk_free.c"
    "test/unit/log.c"
    "test/unit/mallctl.c"
    "test/unit/malloc_io.c"
    "test/unit/math.c"
    "test/unit/mq.c"
    "test/unit/mtx.c"
    "test/unit/pack.c"
    "test/unit/pages.c"
    "test/unit/ph.c"
    "test/unit/prng.c"
    "test/unit/prof_accum.c"
    "test/unit/prof_active.c"
    "test/unit/prof_gdump.c"
    "test/unit/prof_idump.c"
    "test/unit/prof_reset.c"
    "test/unit/prof_tctx.c"
    "test/unit/prof_thread_name.c"
    "test/unit/ql.c"
    "test/unit/qr.c"
    "test/unit/rb.c"
    "test/unit/retained.c"
    "test/unit/rtree.c"
    "test/unit/SFMT.c"
    "test/unit/size_classes.c"
    "test/unit/slab.c"
    "test/unit/smoothstep.c"
    "test/unit/spin.c"
    "test/unit/stats.c"
    "test/unit/stats_print.c"
    "test/unit/ticker.c"
    "test/unit/nstime.c"
    "test/unit/tsd.c"
    "test/unit/witness.c"
    "test/unit/zero.c"
];

jemalloc5_unittests = cc_test {
    name = "jemalloc5_unittests";

    defaults = ["jemalloc5_defaults"];

    gtest = false;

    cflags = common_cflags ++ [
        "-DJEMALLOC_UNIT_TEST"
    ];

    local_include_dirs = common_c_local_includes ++ [
        "test/include"
    ];

    srcs = unit_tests;

    static_libs = ["libjemalloc5_unittest"];

    test_per_src = true;

    target = {
        linux_glibc = {
            enabled = true;
            #  The sanitizer does not work for these tests on the host.
            sanitize = {
                never = true;
            };
        };
    };
};

# -----------------------------------------------------------------------
#  jemalloc integration test library
# -----------------------------------------------------------------------
libjemalloc5_integrationtest = cc_library_static {
    name = "libjemalloc5_integrationtest";

    defaults = ["jemalloc5_defaults"];

    cflags = [
        "-U_FORTIFY_SOURCE"
        "-DJEMALLOC_INTEGRATION_TEST"
    ];

    local_include_dirs = [
        "test/include"
    ];

    srcs = jemalloc5_testlib_srcs ++ lib_src_files;
};

# -----------------------------------------------------------------------
#  jemalloc integration tests
# -----------------------------------------------------------------------
integration_tests = [
    "test/integration/aligned_alloc.c"
    "test/integration/allocated.c"
    "test/integration/extent.c"
    "test/integration/mallocx.c"
    "test/integration/MALLOCX_ARENA.c"
    "test/integration/overflow.c"
    "test/integration/posix_memalign.c"
    "test/integration/rallocx.c"
    "test/integration/sdallocx.c"
    "test/integration/thread_arena.c"
    "test/integration/xallocx.c"
    "test/integration/cpp/basic.cpp"
];

jemalloc5_integrationtests = cc_test {
    name = "jemalloc5_integrationtests";

    defaults = ["jemalloc5_defaults"];

    gtest = false;

    cflags = common_cflags ++ [
        "-DJEMALLOC_INTEGRATION_TEST"
    ];

    local_include_dirs = common_c_local_includes ++ [
        "test/include"
    ];

    srcs = integration_tests;

    static_libs = ["libjemalloc5_integrationtest"];

    test_per_src = true;

    target = {
        linux_glibc = {
            #  The sanitizer does not work for these tests on the host.
            sanitize = {
                never = true;
            };
        };
    };

    #  Needed for basic.cpp test.
    stl = "libc++_static";
};

# -----------------------------------------------------------------------
#  jemalloc stress test library
# -----------------------------------------------------------------------
libjemalloc5_stresstestlib = cc_library_static {
    name = "libjemalloc5_stresstestlib";

    defaults = ["jemalloc5_defaults"];

    cflags = [
        "-DJEMALLOC_STRESS_TEST"
        "-DJEMALLOC_STRESS_TESTLIB"
    ];

    local_include_dirs = [
        "test/include"
    ];

    srcs = jemalloc5_testlib_srcs;
};

# -----------------------------------------------------------------------
#  jemalloc stress tests
# -----------------------------------------------------------------------
#  All tests are in the same order as in the original jemalloc Makefile
#  to make it easier to track changes.
stress_tests = [
    "test/stress/microbench.c"
];

jemalloc5_stresstests = cc_test {
    name = "jemalloc5_stresstests";

    defaults = ["jemalloc5_defaults"];

    gtest = false;

    cflags = common_cflags ++ [
        "-DJEMALLOC_STRESS_TEST"
    ];

    local_include_dirs = common_c_local_includes ++ [
        "test/include"
    ];

    srcs = stress_tests;

    static_libs = [
        "libjemalloc5"
        "libjemalloc5_stresstestlib"
        "libjemalloc5_jet"
    ];

    test_per_src = true;

    target = {
        linux_glibc = {
            #  The sanitizer does not work for these tests on the host.
            sanitize = {
                never = true;
            };
        };
    };
};

in { inherit jemalloc5_defaults jemalloc5_integrationtests jemalloc5_stresstests jemalloc5_unittests libjemalloc5 libjemalloc5_integrationtest libjemalloc5_jet libjemalloc5_stresstestlib libjemalloc5_unittest; }

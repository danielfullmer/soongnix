{ cc_benchmark, cc_defaults, cc_test }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

libhwbinder_test_defaults = cc_defaults {
    name = "libhwbinder_test_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libhidlbase_pgo"
        "liblog"
        "libutils"
        "libcutils"
    ];

    static_libs = ["android.hardware.tests.libhwbinder@1.0"];

    #  Allow dlsym'ing self for statically linked passthrough implementations
    ldflags = ["-rdynamic"];

    #  impls should never be static, these are used only for testing purposes
    #  and test portability since this test pairs with specific hal
    #  implementations
    whole_static_libs = [
        "android.hardware.tests.libhwbinder@1.0-impl"
    ];
};

libhwbinder_benchmark = cc_benchmark {
    name = "libhwbinder_benchmark";
    defaults = ["libhwbinder_test_defaults"];
    srcs = ["Benchmark.cpp"];
};

#  build for benchmark test based on binder.
libbinder_benchmark = cc_benchmark {
    name = "libbinder_benchmark";

    srcs = ["Benchmark_binder.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
        "android.hardware.tests.libbinder"
    ];
};

#  build for throughput benchmark test for hwbinder.
hwbinderThroughputTest = cc_test {
    name = "hwbinderThroughputTest";
    defaults = ["libhwbinder_test_defaults"];
    srcs = ["Benchmark_throughput.cpp"];
};

#  build for latency benchmark test for hwbinder.
libhwbinder_latency = cc_test {
    name = "libhwbinder_latency";
    defaults = ["libhwbinder_test_defaults"];

    srcs = [
        "Latency.cpp"
        "PerfTest.cpp"
    ];
};

in { inherit hwbinderThroughputTest libbinder_benchmark libhwbinder_benchmark libhwbinder_latency libhwbinder_test_defaults; }

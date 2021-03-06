{ cc_benchmark, cc_benchmark_host, cc_defaults, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2013 The Android Open Source Project
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

bionic-benchmarks-defaults = cc_defaults {
    name = "bionic-benchmarks-defaults";
    cflags = [
        "-O2"
        "-fno-builtin"
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-gcc-compat"
        "-Wunused"
    ];
    srcs = [
        "bionic_benchmarks.cpp"
        "atomic_benchmark.cpp"
        "get_heap_size_benchmark.cpp"
        "inttypes_benchmark.cpp"
        "malloc_benchmark.cpp"
        "math_benchmark.cpp"
        "property_benchmark.cpp"
        "pthread_benchmark.cpp"
        "semaphore_benchmark.cpp"
        "stdio_benchmark.cpp"
        "stdlib_benchmark.cpp"
        "string_benchmark.cpp"
        "time_benchmark.cpp"
        "unistd_benchmark.cpp"
    ];
    shared_libs = ["liblog"];
    static_libs = [
        "libbase"
        "libBionicBenchmarksUtils"
        "libtinyxml2"
    ];
    stl = "libc++_static";
};

bionic-benchmarks-extras-defaults = cc_defaults {
    name = "bionic-benchmarks-extras-defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wunused"
    ];
};

#  Build benchmarks for the device (with bionic's .so). Run with:
#    adb shell bionic-benchmarks32
#    adb shell bionic-benchmarks64
bionic-benchmarks = cc_benchmark {
    name = "bionic-benchmarks";
    defaults = ["bionic-benchmarks-defaults"];
    data = [
        "suites/example.xml"
        "suites/memcmp.xml"
        "suites/strcmp.xml"
        "suites/string.xml"
        "suites/strncmp.xml"
        "suites/vdso.xml"
    ];
    static_libs = [
        "libsystemproperties"
        "libasync_safe"
    ];
    include_dirs = ["bionic/libc"];
};

#  We don't build a static benchmark executable because it's not usually
#  useful. If you're trying to run the current benchmarks on an older
#  release, it's (so far at least) always because you want to measure the
#  performance of the old release's libc, and a static benchmark isn't
#  going to let you do that.

#  Build benchmarks for the host (against glibc!). Run with:
bionic-benchmarks-glibc = cc_benchmark_host {
    name = "bionic-benchmarks-glibc";
    defaults = ["bionic-benchmarks-defaults"];
    target = {
        darwin = {
            #  Only supported on linux systems.
            enabled = false;
        };
    };
    data = [
        "suites/example.xml"
        "suites/memcmp.xml"
        "suites/strcmp.xml"
        "suites/string.xml"
        "suites/strncmp.xml"
        "suites/vdso.xml"
    ];
};

libBionicBenchmarksUtils = cc_library_static {
    name = "libBionicBenchmarksUtils";
    defaults = ["bionic-benchmarks-extras-defaults"];
    srcs = ["util.cpp"];
    host_supported = true;
};

bionic-benchmarks-tests = cc_test {
    name = "bionic-benchmarks-tests";
    isolated = true;
    defaults = ["bionic-benchmarks-extras-defaults"];
    srcs = [
        "tests/benchmark_test.cpp"
        "tests/interface_test.cpp"
    ];
    static_libs = [
        "libbase"
        "libBionicBenchmarksUtils"
    ];
    data = [
        "test_suites/test_alignment_onebuf.xml"
        "test_suites/test_alignment_onebuf_manual.xml"
        "test_suites/test_alignment_twobuf.xml"
        "test_suites/test_alignment_twobuf_manual.xml"
        "test_suites/test_from_each.xml"
        "test_suites/test_medium.xml"
        "test_suites/test_size.xml"
        "test_suites/test_small.xml"
    ];
};

in { inherit bionic-benchmarks bionic-benchmarks-defaults bionic-benchmarks-extras-defaults bionic-benchmarks-glibc bionic-benchmarks-tests libBionicBenchmarksUtils; }

{ cc_library_static, cc_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

libgoogle-benchmark = cc_library_static {
    name = "libgoogle-benchmark";
    host_supported = true;
    local_include_dirs = ["include"];
    vendor_available = true;
    cflags = [
        "-DBENCHMARK_ANDROID"
        "-DHAVE_POSIX_REGEX"
        "-Werror"
        "-Wno-deprecated-declarations"
    ];

    srcs = [
        "src/benchmark_api_internal.cc"
        "src/benchmark.cc"
        "src/benchmark_register.cc"
        "src/benchmark_runner.cc"
        "src/colorprint.cc"
        "src/commandlineflags.cc"
        "src/complexity.cc"
        "src/console_reporter.cc"
        "src/counter.cc"
        "src/csv_reporter.cc"
        "src/json_reporter.cc"
        "src/reporter.cc"
        "src/sleep.cc"
        "src/statistics.cc"
        "src/string_util.cc"
        "src/sysinfo.cc"
        "src/timers.cc"
    ];
    export_include_dirs = ["include"];
};

google-benchmark-test = cc_test {
    name = "google-benchmark-test";
    srcs = ["test/basic_test.cc"];
    static_libs = ["libgoogle-benchmark"];
};

in { inherit google-benchmark-test libgoogle-benchmark; }

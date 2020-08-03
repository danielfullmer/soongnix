{ cc_benchmark, cc_defaults, cc_test }:
let

#
#  Copyright (C) 2013-2014 The Android Open Source Project
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

#  -----------------------------------------------------------------------------
#  Benchmarks.
#  -----------------------------------------------------------------------------

#  Build benchmarks for the device. Run with:
#    adb shell liblog-benchmarks
liblog-benchmarks = cc_benchmark {
    name = "liblog-benchmarks";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fno-builtin"
    ];
    shared_libs = [
        "libm"
        "libbase"
        "libcutils"
    ];
    static_libs = ["liblog"];
    srcs = ["liblog_benchmark.cpp"];
};

#  -----------------------------------------------------------------------------
#  Unit tests.
#  -----------------------------------------------------------------------------

liblog-tests-defaults = cc_defaults {
    name = "liblog-tests-defaults";

    cflags = [
        "-fstack-protector-all"
        "-g"
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fno-builtin"
    ];
    srcs = [
        "libc_test.cpp"
        "liblog_test_default.cpp"
        "liblog_test_stderr.cpp"
        "log_id_test.cpp"
        "log_radio_test.cpp"
        "log_read_test.cpp"
        "log_system_test.cpp"
        "log_time_test.cpp"
        "log_wrap_test.cpp"
    ];
    shared_libs = [
        "libcutils"
        "libbase"
    ];
    static_libs = ["liblog"];
};

#  Build tests for the device (with .so). Run with:
#    adb shell /data/nativetest/liblog-unit-tests/liblog-unit-tests
liblog-unit-tests = cc_test {
    name = "liblog-unit-tests";
    defaults = ["liblog-tests-defaults"];
};

CtsLiblogTestCases = cc_test {
    name = "CtsLiblogTestCases";
    defaults = ["liblog-tests-defaults"];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    cflags = ["-DNO_PSTORE"];
    test_suites = [
        "cts"
        "vts"
    ];
};

in { inherit CtsLiblogTestCases liblog-benchmarks liblog-tests-defaults liblog-unit-tests; }

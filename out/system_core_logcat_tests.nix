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

logcat-tests-defaults = cc_defaults {
    name = "logcat-tests-defaults";
    cflags = [
        "-fstack-protector-all"
        "-g"
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fno-builtin"
    ];
};

#  -----------------------------------------------------------------------------
#  Benchmarks
#  ----------------------------------------------------------------------------

#  Build benchmarks for the device. Run with:
#    adb shell /data/nativetest/logcat-benchmarks/logcat-benchmarks
logcat-benchmarks = cc_benchmark {
    name = "logcat-benchmarks";
    defaults = ["logcat-tests-defaults"];
    srcs = ["logcat_benchmark.cpp"];
    shared_libs = ["libbase"];
};

#  -----------------------------------------------------------------------------
#  Unit tests.
#  -----------------------------------------------------------------------------

#  Build tests for the device (with .so). Run with:
#    adb shell /data/nativetest/logcat-unit-tests/logcat-unit-tests
logcat-unit-tests = cc_test {
    name = "logcat-unit-tests";
    defaults = ["logcat-tests-defaults"];
    shared_libs = ["libbase"];
    static_libs = ["liblog"];
    srcs = [
        "logcat_test.cpp"
        "logcatd_test.cpp"
    ];
};

in { inherit logcat-benchmarks logcat-tests-defaults logcat-unit-tests; }

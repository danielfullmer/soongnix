{ cc_defaults, cc_test }:
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

#  -----------------------------------------------------------------------------
#  Unit tests.
#  -----------------------------------------------------------------------------

logd-unit-test-defaults = cc_defaults {
    name = "logd-unit-test-defaults";

    cflags = [
        "-fstack-protector-all"
        "-g"
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fno-builtin"

        "-DAUDITD_LOG_TAG=1003"
        "-DCHATTY_LOG_TAG=1004"
    ];

    srcs = ["logd_test.cpp"];

    shared_libs = [
        "libbase"
        "libcutils"
        "libselinux"
    ];
    static_libs = ["liblog"];
};

#  Build tests for the logger. Run with:
#    adb shell /data/nativetest/logd-unit-tests/logd-unit-tests
logd-unit-tests = cc_test {
    name = "logd-unit-tests";
    defaults = ["logd-unit-test-defaults"];
};

CtsLogdTestCases = cc_test {
    name = "CtsLogdTestCases";
    defaults = ["logd-unit-test-defaults"];
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    test_suites = [
        "cts"
        "vts"
    ];
};

in { inherit CtsLogdTestCases logd-unit-test-defaults logd-unit-tests; }

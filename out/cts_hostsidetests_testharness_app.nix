{ android_test }:
let

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

CtsTestHarnessModeDeviceApp = android_test {
    name = "CtsTestHarnessModeDeviceApp";
    #  Don't include this package in any target
    #  When built, explicitly put it in the data partition.
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    static_libs = [
        "androidx.test.rules"
        "androidx.legacy_legacy-support-v4"
        "compatibility-device-util-axt"
    ];
    srcs = [
        "src/android/testharness/app/TestHarnessActivity.java"
        "src/android/testharness/app/TestHarnessModeDeviceTest.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsTestHarnessModeDeviceApp; }
{ android_test_helper_app }:
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

CtsUsageStatsTestApp1 = android_test_helper_app {
    name = "CtsUsageStatsTestApp1";
    defaults = ["cts_defaults"];
    platform_apis = true;
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "cts-wm-util"
        "junit"
        "ub-uiautomator"
    ];
    libs = [
        "android.test.base.stubs"
        "android.test.runner.stubs"
    ];
    srcs = [
        "src/android/app/usage/cts/test1/SomeActivity.java"
        "src/android/app/usage/cts/test1/SomeActivityWithLocus.java"
        "src/android/app/usage/cts/test1/TestService.java"
        "aidl/android/app/usage/cts/ITestReceiver.aidl"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsUsageStatsTestApp1; }
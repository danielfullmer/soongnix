{ android_test }:
let

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

CtsUsageStatsTestCases = android_test {
    name = "CtsUsageStatsTestCases";
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
        "src/android/app/usage/cts/Activities.java"
        "src/android/app/usage/cts/ActivityTransitionActivity.java"
        "src/android/app/usage/cts/ActivityTransitionActivity2.java"
        "src/android/app/usage/cts/ActivityTransitionTest.java"
        "src/android/app/usage/cts/FragmentTest.java"
        "src/android/app/usage/cts/FragmentTestActivity.java"
        "src/android/app/usage/cts/NetworkUsageStatsTest.java"
        "src/android/app/usage/cts/TaskRootActivity.java"
        "src/android/app/usage/cts/TestService.java"
        "src/android/app/usage/cts/UsageReportingTest.java"
        "src/android/app/usage/cts/UsageStatsTest.java"
        "TestApp1/src/android/app/usage/cts/test1/SomeActivity.java"
        "TestApp1/src/android/app/usage/cts/test1/SomeActivityWithLocus.java"
        "TestApp1/src/android/app/usage/cts/test1/TestService.java"
        "TestApp1/aidl/android/app/usage/cts/ITestReceiver.aidl"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsUsageStatsTestCases; }

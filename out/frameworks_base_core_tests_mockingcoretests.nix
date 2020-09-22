{ android_test }:
let

#
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
#

FrameworksMockingCoreTests = android_test {
    name = "FrameworksMockingCoreTests";

    srcs = [
        "src/android/app/activity/ActivityThreadClientTest.java"
        "src/android/util/TimingsTraceLogTest.java"
    ];

    static_libs = [
        "frameworks-base-testutils"
        "services.core"
        "androidx.test.runner"
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "mockito-target-extended-minus-junit4"
        "platform-test-annotations"
        "truth-prebuilt"
        "testables"
        "ub-uiautomator"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    #  These are not normally accessible from apps so they must be explicitly included.
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";
};

in { inherit FrameworksMockingCoreTests; }

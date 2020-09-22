{ android_test }:
let

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

CtsAndroidAppTestCases = android_test {
    name = "CtsAndroidAppTestCases";
    defaults = ["cts_defaults"];
    platform_apis = true;
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "androidx.test.rules"
        "junit"
    ];
    srcs = [
        "src/android/app/cts/ApplyOverrideConfigurationActivity.java"
        "src/android/app/cts/ApplyOverrideConfigurationTest.java"
        "src/android/app/cts/KeyguardInitialLockTest.java"
        "src/android/app/cts/PictureInPictureActionsTest.java"
        "src/android/app/cts/PictureInPictureActivity.java"
        "src/android/app/cts/PictureInPictureParamsBuilderTest.java"
        "src/android/app/cts/RemoteActionTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsAndroidAppTestCases; }

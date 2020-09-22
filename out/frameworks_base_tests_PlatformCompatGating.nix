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

PlatformCompatGating = android_test {
    name = "PlatformCompatGating";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/compat/testing/DummyApi.java"
        "src/com/android/tests/gating/PlatformCompatGatingTest.java"
        "src/com/android/tests/gating/PlatformCompatPermissionsTest.java"
        "src/com/android/tests/gating/PlatformCompatCommandNotInstalledTest.kt"
    ];
    test_suites = ["device-tests"];
    static_libs = [
        "junit"
        "androidx.test.runner"
        "androidx.test.core"
        "androidx.test.ext.junit"
        "mockito-target-minus-junit4"
        "testng"
        "truth-prebuilt"
        "platform-compat-test-rules"
    ];
};

in { inherit PlatformCompatGating; }

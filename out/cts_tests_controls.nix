{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsControlsDeviceTestCases = android_test {
    name = "CtsControlsDeviceTestCases";
    defaults = ["cts_defaults"];

    test_suites = [
        "cts"
        "general-tests"
    ];

    static_libs = [
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "androidx.test.uiautomator_uiautomator"
        "compatibility-device-util-axt"
    ];

    libs = [
        "android.test.mock"
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/controls/cts/CtsControlBuilderTest.java"
        "src/android/controls/cts/CtsControlTemplateTest.java"
        "src/android/controls/cts/CtsControlsDeviceActivity.java"
        "src/android/controls/cts/CtsControlsPublisher.java"
        "src/android/controls/cts/CtsControlsService.java"
        "src/android/controls/cts/CtsControlsServiceTest.java"
    ];
    sdk_version = "test_current";
};

in { inherit CtsControlsDeviceTestCases; }
{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsSystemUiTestCases = android_test {
    name = "CtsSystemUiTestCases";
    defaults = ["cts_defaults"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = ["android.test.runner.stubs"];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "androidx.test.rules"
        "cts-wm-util"
        "ub-uiautomator"
    ];
    srcs = [
        "src/android/systemui/cts/ColorUtils.java"
        "src/android/systemui/cts/LightBarActivity.java"
        "src/android/systemui/cts/LightBarBaseActivity.java"
        "src/android/systemui/cts/LightBarTestBase.java"
        "src/android/systemui/cts/LightBarTests.java"
        "src/android/systemui/cts/LightBarThemeActivity.java"
        "src/android/systemui/cts/LightBarThemeTest.java"
        "src/android/systemui/cts/ScreenshotTestRule.java"
        "src/android/systemui/cts/TouchHelper.java"
        "src/android/systemui/cts/WindowInsetsActivity.java"
        "src/android/systemui/cts/WindowInsetsBehaviorTests.java"
        "src/android/systemui/cts/WindowInsetsPresenterDrawable.java"
    ];
    platform_apis = true;
};

in { inherit CtsSystemUiTestCases; }

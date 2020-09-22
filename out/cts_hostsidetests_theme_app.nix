{ android_test_helper_app }:
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

CtsThemeDeviceApp = android_test_helper_app {
    name = "CtsThemeDeviceApp";
    defaults = ["cts_support_defaults"];
    static_libs = ["androidx.test.rules"];
    srcs = [
        "src/android/theme/app/AssetBucketVerifier.java"
        "src/android/theme/app/ConditionCheck.java"
        "src/android/theme/app/GenerateBitmapTask.java"
        "src/android/theme/app/GenerateImagesActivity.java"
        "src/android/theme/app/LayoutInfo.java"
        "src/android/theme/app/ReferenceImagesTest.java"
        "src/android/theme/app/ReferenceViewGroup.java"
        "src/android/theme/app/TestConfiguration.java"
        "src/android/theme/app/ThemeDeviceActivity.java"
        "src/android/theme/app/ThemeInfo.java"
        "src/android/theme/app/ThemeTestUtils.java"
        "src/android/theme/app/modifiers/AbstractLayoutModifier.java"
        "src/android/theme/app/modifiers/DatePickerModifier.java"
        "src/android/theme/app/modifiers/ProgressBarModifier.java"
        "src/android/theme/app/modifiers/SearchViewModifier.java"
        "src/android/theme/app/modifiers/TimePickerModifier.java"
        "src/android/theme/app/modifiers/ViewCheckedModifier.java"
        "src/android/theme/app/modifiers/ViewPressedModifier.java"
    ];
    #  Tell the Android Asset Packaging Tool not to strip for some densities
    aapt_include_all_resources = true;
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsThemeDeviceApp; }

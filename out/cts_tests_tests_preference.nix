{ android_test }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

CtsPreferenceTestCases = android_test {
    name = "CtsPreferenceTestCases";
    defaults = ["cts_defaults"];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "mockito-target-minus-junit4"
        "ub-uiautomator"
    ];

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/preference/cts/CheckBoxPreferenceTest.java"
        "src/android/preference/cts/CustomCheckBoxPreference.java"
        "src/android/preference/cts/CustomCheckBoxPreferenceTest.java"
        "src/android/preference/cts/CustomDialogPreference.java"
        "src/android/preference/cts/CustomDialogPreferenceTest.java"
        "src/android/preference/cts/CustomEditTextPreference.java"
        "src/android/preference/cts/CustomEditTextPreferenceTest.java"
        "src/android/preference/cts/CustomPreference.java"
        "src/android/preference/cts/CustomPreferenceGroup.java"
        "src/android/preference/cts/CustomSwitchPreference.java"
        "src/android/preference/cts/CustomSwitchPreferenceTest.java"
        "src/android/preference/cts/DialogPreferenceTest.java"
        "src/android/preference/cts/EditTextPreferenceTest.java"
        "src/android/preference/cts/FragmentPreferences.java"
        "src/android/preference/cts/FragmentPreferencesTest.java"
        "src/android/preference/cts/ListPreferenceTest.java"
        "src/android/preference/cts/PreferenceActivityFlowLandscapeTest.java"
        "src/android/preference/cts/PreferenceActivityFlowPortraitTest.java"
        "src/android/preference/cts/PreferenceActivityFlowTest.java"
        "src/android/preference/cts/PreferenceActivityLegacyFlowTest.java"
        "src/android/preference/cts/PreferenceActivityTest.java"
        "src/android/preference/cts/PreferenceCategoryTest.java"
        "src/android/preference/cts/PreferenceCtsActivity.java"
        "src/android/preference/cts/PreferenceDataStoreTest.java"
        "src/android/preference/cts/PreferenceFragmentActivity.java"
        "src/android/preference/cts/PreferenceFragmentTest.java"
        "src/android/preference/cts/PreferenceFromCodeActivity.java"
        "src/android/preference/cts/PreferenceGroupTest.java"
        "src/android/preference/cts/PreferenceParentGroupTest.java"
        "src/android/preference/cts/PreferenceRecycleTest.java"
        "src/android/preference/cts/PreferenceTest.java"
        "src/android/preference/cts/PreferenceWithHeaders.java"
        "src/android/preference/cts/PreferenceWithHeadersLandscape.java"
        "src/android/preference/cts/PreferenceWithHeadersPortrait.java"
        "src/android/preference/cts/PreferenceWithHeadersTest.java"
        "src/android/preference/cts/PreferencesFromXml.java"
        "src/android/preference/cts/PreferencesFromXmlNested.java"
        "src/android/preference/cts/PreferencesFromXmlRecycle.java"
        "src/android/preference/cts/RecycleCheckPreference.java"
        "src/android/preference/cts/SwitchPreferenceTest.java"
        "src/android/preference/cts/TestUtils.java"
    ];

    sdk_version = "test_current";
};

in { inherit CtsPreferenceTestCases; }

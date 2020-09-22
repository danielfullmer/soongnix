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

SettingsLibTests = android_test {
    name = "SettingsLibTests";
    defaults = [
        "SettingsLibDefaults"
        "framework-wifi-test-defaults"
    ];

    certificate = "platform";

    srcs = [
        "src/com/android/settingslib/BaseTest.java"
        "src/com/android/settingslib/applications/ApplicationsStateTest.java"
        "src/com/android/settingslib/applications/StorageStatsSourceTest.java"
        "src/com/android/settingslib/bluetooth/BluetoothEventManagerIntegTest.java"
        "src/com/android/settingslib/drawable/UserIconDrawableTest.java"
        "src/com/android/settingslib/graph/BatteryMeterDrawableBaseTest.java"
        "src/com/android/settingslib/inputmethod/ComparableUtils.java"
        "src/com/android/settingslib/inputmethod/InputMethodPreferenceTest.java"
        "src/com/android/settingslib/inputmethod/InputMethodSubtypePreferenceTest.java"
        "src/com/android/settingslib/users/AppRestrictionsHelperTest.java"
        "src/com/android/settingslib/utils/NetworkPolicyEditorTest.java"
        "src/com/android/settingslib/utils/ZoneGetterTest.java"
        "src/com/android/settingslib/wifi/AccessPointTest.java"
        "src/com/android/settingslib/wifi/WifiTrackerTest.java"
    ];

    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    static_libs = [
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];

    dxflags = ["--multi-dex"];
};

in { inherit SettingsLibTests; }

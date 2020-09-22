{ android_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

SettingsUITests = android_test {
    name = "SettingsUITests";
    platform_apis = true;
    certificate = "platform";
    test_suites = ["device-tests"];
    srcs = [
        "src/com/android/settings/ui/AboutPhoneSettingsTests.java"
        "src/com/android/settings/ui/AppsSettingsRetainFilterTests.java"
        "src/com/android/settings/ui/AppsSettingsTests.java"
        "src/com/android/settings/ui/BatterySettingsUITest.java"
        "src/com/android/settings/ui/ConnectedDeviceTests.java"
        "src/com/android/settings/ui/DataUsageSettingsTests.java"
        "src/com/android/settings/ui/HomepageDisplayTests.java"
        "src/com/android/settings/ui/LocationSettingsTests.java"
        "src/com/android/settings/ui/MoreWirelessSettingsTest2.java"
        "src/com/android/settings/ui/MoreWirelessSettingsTests.java"
        "src/com/android/settings/ui/NotificationSettingsTests.java"
        "src/com/android/settings/ui/SecuritySettingsLaunchTest.java"
        "src/com/android/settings/ui/SoundSettingsTest.java"
        "src/com/android/settings/ui/StorageSettingsUITest.java"
        "src/com/android/settings/ui/StorageWizardTest.java"
        "src/com/android/settings/ui/SyncSettingsTest.java"
        "src/com/android/settings/ui/WirelessNetworkSettingsTests.java"
        "src/com/android/settings/ui/ZonePickerSettingsTest.java"
        "src/com/android/settings/ui/inputmethods/DataSaverSummaryUITest.java"
        "src/com/android/settings/ui/inputmethods/SpellCheckerSettingsUITest.java"
        "src/com/android/settings/ui/testutils/SettingsTestUtils.java"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    static_libs = [
        "androidx.test.rules"
        "app-helpers-core"
        "launcher-helper-lib"
        "metrics-helper-lib"
        "platform-test-annotations"
        "settings-helper"
        "sysui-helper"
        "timeresult-helper-lib"
        "truth-prebuilt"
        "ub-uiautomator"
    ];

    # sdk_version: "current",
};

in { inherit SettingsUITests; }

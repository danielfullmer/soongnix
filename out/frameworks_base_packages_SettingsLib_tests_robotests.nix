{ android_app, android_robolectric_test, java_library }:
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

# ###########################################################
#  SettingsLib Shell app just for Robolectric test target.  #
# ###########################################################

SettingsLibShell = android_app {
    name = "SettingsLibShell";
    defaults = ["SettingsLibDefaults"];
    platform_apis = true;

    privileged = true;

    resource_dirs = ["res"];
};

# ###########################################################
#  SettingsLib Robolectric test target.                     #
# ###########################################################
SettingsLibRoboTests = android_robolectric_test {
    name = "SettingsLibRoboTests";
    srcs = [
        "src/com/android/settingslib/CustomEditTextPreferenceComaptTest.java"
        "src/com/android/settingslib/CustomEditTextPreferenceTest.java"
        "src/com/android/settingslib/DeviceInfoUtilsTest.java"
        "src/com/android/settingslib/HelpUtilsTest.java"
        "src/com/android/settingslib/RestrictedLockUtilsTest.java"
        "src/com/android/settingslib/RestrictedPreferenceHelperTest.java"
        "src/com/android/settingslib/RestrictedSwitchPreferenceTest.java"
        "src/com/android/settingslib/TetherUtilTest.java"
        "src/com/android/settingslib/TwoTargetPreferenceTest.java"
        "src/com/android/settingslib/UtilsTest.java"
        "src/com/android/settingslib/accessibility/AccessibilityUtilsTest.java"
        "src/com/android/settingslib/applications/ApplicationsStateRoboTest.java"
        "src/com/android/settingslib/applications/DefaultAppInfoTest.java"
        "src/com/android/settingslib/applications/ServiceListingTest.java"
        "src/com/android/settingslib/bluetooth/A2dpProfileTest.java"
        "src/com/android/settingslib/bluetooth/A2dpSinkProfileTest.java"
        "src/com/android/settingslib/bluetooth/BluetoothEventManagerTest.java"
        "src/com/android/settingslib/bluetooth/BluetoothUtilsTest.java"
        "src/com/android/settingslib/bluetooth/CachedBluetoothDeviceManagerTest.java"
        "src/com/android/settingslib/bluetooth/CachedBluetoothDeviceTest.java"
        "src/com/android/settingslib/bluetooth/HeadsetProfileTest.java"
        "src/com/android/settingslib/bluetooth/HearingAidDeviceManagerTest.java"
        "src/com/android/settingslib/bluetooth/HearingAidProfileTest.java"
        "src/com/android/settingslib/bluetooth/HfpClientProfileTest.java"
        "src/com/android/settingslib/bluetooth/HidDeviceProfileTest.java"
        "src/com/android/settingslib/bluetooth/LocalBluetoothProfileManagerTest.java"
        "src/com/android/settingslib/bluetooth/MapClientProfileTest.java"
        "src/com/android/settingslib/bluetooth/PbapClientProfileTest.java"
        "src/com/android/settingslib/bluetooth/SapProfileTest.java"
        "src/com/android/settingslib/core/AbstractPreferenceControllerTest.java"
        "src/com/android/settingslib/core/instrumentation/MetricsFeatureProviderTest.java"
        "src/com/android/settingslib/core/instrumentation/SharedPreferenceLoggerTest.java"
        "src/com/android/settingslib/core/instrumentation/VisibilityLoggerMixinTest.java"
        "src/com/android/settingslib/core/lifecycle/LifecycleTest.java"
        "src/com/android/settingslib/development/DeveloperOptionsPreferenceControllerTest.java"
        "src/com/android/settingslib/development/DevelopmentSettingsEnablerTest.java"
        "src/com/android/settingslib/development/EnableAdbPreferenceControllerTest.java"
        "src/com/android/settingslib/development/LogdSizePreferenceControllerTest.java"
        "src/com/android/settingslib/development/LogpersistPreferenceControllerTest.java"
        "src/com/android/settingslib/development/SystemPropPokerTest.java"
        "src/com/android/settingslib/deviceinfo/BluetoothAddressPreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/ConnectivityPreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/ImsStatusPreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/IpAddressPreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/SerialNumberPreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/SimStatusImeiInfoPreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/UptimePreferenceControllerTest.java"
        "src/com/android/settingslib/deviceinfo/WifiMacAddressPreferenceControllerTest.java"
        "src/com/android/settingslib/display/BrightnessUtilsTest.java"
        "src/com/android/settingslib/drawer/ActivityTileTest.java"
        "src/com/android/settingslib/drawer/CategoryKeyTest.java"
        "src/com/android/settingslib/drawer/MasterSwitchControllerTest.java"
        "src/com/android/settingslib/drawer/ProviderTileTest.java"
        "src/com/android/settingslib/drawer/SwitchesProviderTest.java"
        "src/com/android/settingslib/drawer/TileUtilsTest.java"
        "src/com/android/settingslib/fuelgauge/BatterySaverUtilsTest.java"
        "src/com/android/settingslib/fuelgauge/PowerWhitelistBackendTest.java"
        "src/com/android/settingslib/graph/BatteryMeterDrawableBaseTest.java"
        "src/com/android/settingslib/graph/BluetoothDeviceLayerDrawableTest.java"
        "src/com/android/settingslib/inputmethod/InputMethodAndSubtypeUtilCompatTest.java"
        "src/com/android/settingslib/inputmethod/InputMethodAndSubtypeUtilTest.java"
        "src/com/android/settingslib/license/LicenseHtmlGeneratorFromXmlTest.java"
        "src/com/android/settingslib/license/LicenseHtmlLoaderCompatTest.java"
        "src/com/android/settingslib/location/InjectedSettingTest.java"
        "src/com/android/settingslib/location/RecentLocationAccessesTest.java"
        "src/com/android/settingslib/location/RecentLocationAppsTest.java"
        "src/com/android/settingslib/media/BluetoothMediaDeviceTest.java"
        "src/com/android/settingslib/media/InfoMediaDeviceTest.java"
        "src/com/android/settingslib/media/InfoMediaManagerTest.java"
        "src/com/android/settingslib/media/LocalMediaManagerTest.java"
        "src/com/android/settingslib/media/MediaDeviceTest.java"
        "src/com/android/settingslib/media/MediaDeviceUtilsTest.java"
        "src/com/android/settingslib/media/MediaManagerTest.java"
        "src/com/android/settingslib/media/PhoneMediaDeviceTest.java"
        "src/com/android/settingslib/net/DataUsageControllerTest.java"
        "src/com/android/settingslib/net/DataUsageUtilsTest.java"
        "src/com/android/settingslib/net/NetworkCycleChartDataLoaderTest.java"
        "src/com/android/settingslib/net/NetworkCycleDataForUidLoaderTest.java"
        "src/com/android/settingslib/net/NetworkCycleDataLoaderTest.java"
        "src/com/android/settingslib/notification/EnableZenModeDialogTest.java"
        "src/com/android/settingslib/notification/ZenDurationDialogTest.java"
        "src/com/android/settingslib/suggestions/ShadowSuggestionController.java"
        "src/com/android/settingslib/suggestions/SuggestionControllerMixinCompatTest.java"
        "src/com/android/settingslib/suggestions/SuggestionControllerMixinTest.java"
        "src/com/android/settingslib/utils/IconCacheTest.java"
        "src/com/android/settingslib/utils/PowerUtilTest.java"
        "src/com/android/settingslib/utils/StringUtilTest.java"
        "src/com/android/settingslib/utils/ThreadUtilsTest.java"
        "src/com/android/settingslib/widget/ActionBarShadowControllerTest.java"
        "src/com/android/settingslib/widget/ActionButtonsPreferenceTest.java"
        "src/com/android/settingslib/widget/AdaptiveIconTest.java"
        "src/com/android/settingslib/widget/AdaptiveOutlineDrawableTest.java"
        "src/com/android/settingslib/widget/AnimatedImageViewTest.java"
        "src/com/android/settingslib/widget/AppEntitiesHeaderControllerTest.java"
        "src/com/android/settingslib/widget/BarChartInfoTest.java"
        "src/com/android/settingslib/widget/BarChartPreferenceTest.java"
        "src/com/android/settingslib/widget/FooterPreferenceTest.java"
        "src/com/android/settingslib/widget/LayoutPreferenceTest.java"
        "src/com/android/settingslib/widget/RadioButtonPreferenceTest.java"
        "src/com/android/settingslib/widget/UpdatableListPreferenceDialogFragmentTest.java"
        "src/com/android/settingslib/widget/apppreference/AppPreferenceTest.java"
        "src/com/android/settingslib/wifi/AccessPointPreferenceTest.java"
        "src/com/android/settingslib/wifi/TimestampedScoredNetworkTest.java"
        "src/com/android/settingslib/wifi/WifiEntryPreferenceTest.java"
        "src/com/android/settingslib/wifi/WifiUtilsTest.java"
    ];
    static_libs = [
        "SettingsLib-robo-testutils"
    ];
    java_resource_dirs = ["config"];
    instrumentation_for = "SettingsLibShell";
    coverage_libs = ["SettingsLib"];
    test_options = {
        timeout = 36000;
    };
};

SettingsLib-robo-testutils = java_library {
    name = "SettingsLib-robo-testutils";
    srcs = [
        "testutils/com/android/settingslib/testutils/DrawableTestHelper.java"
        "testutils/com/android/settingslib/testutils/shadow/ShadowActivityManager.java"
        "testutils/com/android/settingslib/testutils/shadow/ShadowBluetoothAdapter.java"
        "testutils/com/android/settingslib/testutils/shadow/ShadowDefaultDialerManager.java"
        "testutils/com/android/settingslib/testutils/shadow/ShadowRouter2Manager.java"
        "testutils/com/android/settingslib/testutils/shadow/ShadowSmsApplication.java"
        "testutils/com/android/settingslib/testutils/shadow/ShadowUserManager.java"
    ];

    libs = [
        "Robolectric_all-target"
        "truth-prebuilt"
    ];
};

in { inherit SettingsLib-robo-testutils SettingsLibRoboTests SettingsLibShell; }

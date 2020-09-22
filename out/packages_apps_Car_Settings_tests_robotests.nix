{ android_robolectric_test }:
let

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

#  Car Settings Robolectric test target.
CarSettingsRoboTests = android_robolectric_test {
    name = "CarSettingsRoboTests";
    srcs = [
        "src/com/android/car/settings/accounts/AccountAutoSyncPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/AccountDetailsFragmentTest.java"
        "src/com/android/car/settings/accounts/AccountDetailsPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/AccountDetailsSettingControllerTest.java"
        "src/com/android/car/settings/accounts/AccountDetailsWithSyncStatusPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/AccountListPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/AccountSettingsFragmentTest.java"
        "src/com/android/car/settings/accounts/AccountSyncDetailsFragmentTest.java"
        "src/com/android/car/settings/accounts/AccountSyncDetailsPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/AccountSyncPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/AccountTypesHelperTest.java"
        "src/com/android/car/settings/accounts/AccountsEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/accounts/ChooseAccountPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/AppPermissionsEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/ApplicationDetailsFragmentTest.java"
        "src/com/android/car/settings/applications/ApplicationListItemManagerTest.java"
        "src/com/android/car/settings/applications/ApplicationPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/ApplicationsSettingsPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/ApplicationsUtilsTest.java"
        "src/com/android/car/settings/applications/NotificationsPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/PermissionsPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/VersionPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/assist/AssistConfigBasePreferenceControllerTest.java"
        "src/com/android/car/settings/applications/assist/DefaultVoiceInputPickerEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/assist/DefaultVoiceInputPickerPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/assist/ScreenshotContextPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/assist/TextContextPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/assist/VoiceInputInfoProviderTest.java"
        "src/com/android/car/settings/applications/assist/VoiceInputUtilsTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAppEntryBasePreferenceControllerTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAppUtilsTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAppsPickerBasePreferenceControllerTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAppsPickerEntryBasePreferenceControllerTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAssistantPickerEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAutofillPickerEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/defaultapps/DefaultAutofillPickerPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/managedomainurls/AppLinkStatePreferenceControllerTest.java"
        "src/com/android/car/settings/applications/managedomainurls/ClearDefaultsPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/managedomainurls/DomainAppPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/managedomainurls/DomainUrlsPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/managedomainurls/DomainUrlsUtilsTest.java"
        "src/com/android/car/settings/applications/specialaccess/AppEntryListManagerTest.java"
        "src/com/android/car/settings/applications/specialaccess/AppOpsPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/specialaccess/AppStateAppOpsBridgeTest.java"
        "src/com/android/car/settings/applications/specialaccess/AppStatePremiumSmsBridgeTest.java"
        "src/com/android/car/settings/applications/specialaccess/MoreSpecialAccessPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/specialaccess/NotificationAccessPreferenceControllerTest.java"
        "src/com/android/car/settings/applications/specialaccess/PremiumSmsAccessPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothAddressPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothBondedDevicesPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDeviceAddressPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDeviceDetailsFragmentTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDeviceNamePreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDevicePickerFragmentTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDevicePickerPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDevicePreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDevicePreferenceTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDeviceProfilePreferenceTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDeviceProfilesPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDevicesGroupPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothDisconnectConfirmDialogFragmentTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothNamePreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothPairingSelectionFragmentTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothRenameDialogFragmentTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothRequestPermissionActivityTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothScanningDevicesGroupPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothSettingsFragmentTest.java"
        "src/com/android/car/settings/bluetooth/BluetoothUnbondedDevicesPreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/LocalRenameDialogFragmentTest.java"
        "src/com/android/car/settings/bluetooth/PairNewDevicePreferenceControllerTest.java"
        "src/com/android/car/settings/bluetooth/RemoteRenameDialogFragmentTest.java"
        "src/com/android/car/settings/bluetooth/Utf8ByteLengthFilterTest.java"
        "src/com/android/car/settings/common/BaseCarSettingsActivityTest.java"
        "src/com/android/car/settings/common/ButtonPreferenceTest.java"
        "src/com/android/car/settings/common/ConfirmationDialogFragmentTest.java"
        "src/com/android/car/settings/common/ErrorDialogTest.java"
        "src/com/android/car/settings/common/ExtraSettingsLoaderTest.java"
        "src/com/android/car/settings/common/ExtraSettingsPreferenceControllerTest.java"
        "src/com/android/car/settings/common/FakePreferenceController.java"
        "src/com/android/car/settings/common/GroupSelectionPreferenceControllerTest.java"
        "src/com/android/car/settings/common/MasterSwitchPreferenceTest.java"
        "src/com/android/car/settings/common/PasswordEditTextPreferenceDialogFragmentTest.java"
        "src/com/android/car/settings/common/PreferenceControllerListHelperTest.java"
        "src/com/android/car/settings/common/PreferenceControllerTest.java"
        "src/com/android/car/settings/common/PreferenceControllerTestHelper.java"
        "src/com/android/car/settings/common/PreferenceUtilTest.java"
        "src/com/android/car/settings/common/PreferenceXmlParserTest.java"
        "src/com/android/car/settings/common/ProgressBarPreferenceTest.java"
        "src/com/android/car/settings/common/SettingsFragmentTest.java"
        "src/com/android/car/settings/common/ValidatedEditTextPreferenceDialogFragmentTest.java"
        "src/com/android/car/settings/datausage/AppDataUsageFragmentTest.java"
        "src/com/android/car/settings/datausage/AppDataUsagePreferenceControllerTest.java"
        "src/com/android/car/settings/datausage/AppsNetworkStatsManagerTest.java"
        "src/com/android/car/settings/datausage/CycleResetDayOfMonthPickerPreferenceControllerTest.java"
        "src/com/android/car/settings/datausage/DataLimitPreferenceControllerTest.java"
        "src/com/android/car/settings/datausage/DataUsageEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/datausage/DataUsageSummaryPreferenceControllerTest.java"
        "src/com/android/car/settings/datausage/DataUsageSummaryPreferenceTest.java"
        "src/com/android/car/settings/datausage/DataUsageUtilsTest.java"
        "src/com/android/car/settings/datausage/DataWarningPreferenceControllerTest.java"
        "src/com/android/car/settings/datausage/UsageBytesThresholdPickerDialogTest.java"
        "src/com/android/car/settings/datausage/UsageCycleResetDayOfMonthPickerDialogTest.java"
        "src/com/android/car/settings/datetime/AutoDatetimeTogglePreferenceControllerTest.java"
        "src/com/android/car/settings/datetime/AutoTimeZoneTogglePreferenceControllerTest.java"
        "src/com/android/car/settings/datetime/DatePickerPreferenceControllerTest.java"
        "src/com/android/car/settings/datetime/TimeFormatTogglePreferenceControllerTest.java"
        "src/com/android/car/settings/datetime/TimePickerFragmentTest.java"
        "src/com/android/car/settings/datetime/TimePickerPreferenceControllerTest.java"
        "src/com/android/car/settings/datetime/TimeZonePickerPreferenceControllerTest.java"
        "src/com/android/car/settings/datetime/TimeZonePickerScreenPreferenceControllerTest.java"
        "src/com/android/car/settings/development/DevelopmentSettingsUtilTest.java"
        "src/com/android/car/settings/display/AdaptiveBrightnessTogglePreferenceControllerTest.java"
        "src/com/android/car/settings/display/BrightnessLevelPreferenceControllerTest.java"
        "src/com/android/car/settings/inputmethod/EnabledKeyboardPreferenceControllerTest.java"
        "src/com/android/car/settings/inputmethod/InputMethodUtilTest.java"
        "src/com/android/car/settings/inputmethod/KeyboardManagementPreferenceControllerTest.java"
        "src/com/android/car/settings/inputmethod/KeyboardPreferenceControllerTest.java"
        "src/com/android/car/settings/language/LanguageBasePreferenceControllerTest.java"
        "src/com/android/car/settings/language/LocalePreferenceProviderTest.java"
        "src/com/android/car/settings/location/LocationFooterPreferenceControllerTest.java"
        "src/com/android/car/settings/location/LocationServicesPreferenceControllerTest.java"
        "src/com/android/car/settings/location/LocationSettingsFragmentTest.java"
        "src/com/android/car/settings/location/RecentLocationRequestsEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/location/RecentLocationRequestsPreferenceControllerTest.java"
        "src/com/android/car/settings/network/AddMobileNetworkPreferenceControllerTest.java"
        "src/com/android/car/settings/network/MobileDataTogglePreferenceControllerTest.java"
        "src/com/android/car/settings/network/MobileNetworkEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/network/MobileNetworkFragmentTest.java"
        "src/com/android/car/settings/network/MobileNetworkListPreferenceControllerTest.java"
        "src/com/android/car/settings/network/MobileNetworkUpdateManagerTest.java"
        "src/com/android/car/settings/network/NetworkUtilsTest.java"
        "src/com/android/car/settings/network/RoamingPreferenceControllerTest.java"
        "src/com/android/car/settings/network/SubscriptionUtilsTest.java"
        "src/com/android/car/settings/network/SubscriptionsChangeListenerTest.java"
        "src/com/android/car/settings/privacy/PrivacyExtraPreferenceControllerTest.java"
        "src/com/android/car/settings/security/ChooseLockPatternFragmentTest.java"
        "src/com/android/car/settings/security/ChooseLockPinPasswordFragmentTest.java"
        "src/com/android/car/settings/security/ConfirmLockPinPasswordFragmentTest.java"
        "src/com/android/car/settings/security/CredentialsResetPreferenceControllerTest.java"
        "src/com/android/car/settings/security/InitialLockSetupServiceTest.java"
        "src/com/android/car/settings/security/LockTypeBasePreferenceControllerTest.java"
        "src/com/android/car/settings/security/NoLockPreferenceControllerTest.java"
        "src/com/android/car/settings/security/PasswordHelperTest.java"
        "src/com/android/car/settings/security/PinPadViewTest.java"
        "src/com/android/car/settings/security/SaveLockWorkerTest.java"
        "src/com/android/car/settings/security/SecurityEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/sound/RingtonePreferenceControllerTest.java"
        "src/com/android/car/settings/sound/VolumeSettingsPreferenceControllerTest.java"
        "src/com/android/car/settings/sound/VolumeSettingsRingtoneManagerTest.java"
        "src/com/android/car/settings/storage/AppStorageSettingsDetailsFragmentTest.java"
        "src/com/android/car/settings/storage/AppsStorageStatsManagerTest.java"
        "src/com/android/car/settings/storage/FileSizeFormatterTest.java"
        "src/com/android/car/settings/storage/StorageApplicationListPreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageAsyncLoaderTest.java"
        "src/com/android/car/settings/storage/StorageFileCategoryPreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageMediaCategoryDetailPreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageMediaCategoryPreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageSettingsManagerTest.java"
        "src/com/android/car/settings/storage/StorageSizeBasePreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageSystemCategoryPreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageUsageBasePreferenceControllerTest.java"
        "src/com/android/car/settings/storage/StorageUtilsTest.java"
        "src/com/android/car/settings/storage/VolumeSizesLoaderTest.java"
        "src/com/android/car/settings/suggestions/SuggestionPreferenceTest.java"
        "src/com/android/car/settings/suggestions/SuggestionsPreferenceControllerTest.java"
        "src/com/android/car/settings/system/BluetoothMacAddressPreferenceControllerTest.java"
        "src/com/android/car/settings/system/BuildNumberPreferenceControllerTest.java"
        "src/com/android/car/settings/system/DeveloperOptionsEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/system/MasterClearAccountsPreferenceControllerTest.java"
        "src/com/android/car/settings/system/MasterClearConfirmFragmentTest.java"
        "src/com/android/car/settings/system/MasterClearEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/system/MasterClearFragmentTest.java"
        "src/com/android/car/settings/system/MasterClearOtherUsersPresentPreferenceControllerTest.java"
        "src/com/android/car/settings/system/MasterClearResetEsimPreferenceControllerTest.java"
        "src/com/android/car/settings/system/RegulatoryInfoDisplayActivityTest.java"
        "src/com/android/car/settings/system/ResetEsimPreferenceControllerTest.java"
        "src/com/android/car/settings/system/ResetNetworkConfirmFragmentTest.java"
        "src/com/android/car/settings/system/ResetNetworkEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/system/ResetNetworkSubscriptionPreferenceControllerTest.java"
        "src/com/android/car/settings/system/SystemUpdatePreferenceControllerTest.java"
        "src/com/android/car/settings/system/legal/LegalPreferenceControllerTest.java"
        "src/com/android/car/settings/testutils/BaseTestActivity.java"
        "src/com/android/car/settings/testutils/DialogTestUtils.java"
        "src/com/android/car/settings/testutils/DummyFragment.java"
        "src/com/android/car/settings/testutils/FragmentController.java"
        "src/com/android/car/settings/testutils/ShadowAccountManager.java"
        "src/com/android/car/settings/testutils/ShadowActivityManager.java"
        "src/com/android/car/settings/testutils/ShadowAppOpsManager.java"
        "src/com/android/car/settings/testutils/ShadowApplicationPackageManager.java"
        "src/com/android/car/settings/testutils/ShadowApplicationsState.java"
        "src/com/android/car/settings/testutils/ShadowAutofillServiceInfo.java"
        "src/com/android/car/settings/testutils/ShadowBluetoothAdapter.java"
        "src/com/android/car/settings/testutils/ShadowBluetoothPan.java"
        "src/com/android/car/settings/testutils/ShadowCar.java"
        "src/com/android/car/settings/testutils/ShadowCarUnitsManager.java"
        "src/com/android/car/settings/testutils/ShadowCarUserManagerHelper.java"
        "src/com/android/car/settings/testutils/ShadowCarWifiManager.java"
        "src/com/android/car/settings/testutils/ShadowCarrierConfigManager.java"
        "src/com/android/car/settings/testutils/ShadowConnectivityManager.java"
        "src/com/android/car/settings/testutils/ShadowContentResolver.java"
        "src/com/android/car/settings/testutils/ShadowDataUsageController.java"
        "src/com/android/car/settings/testutils/ShadowDefaultDialerManager.java"
        "src/com/android/car/settings/testutils/ShadowDevicePolicyManager.java"
        "src/com/android/car/settings/testutils/ShadowINetworkStatsServiceStub.java"
        "src/com/android/car/settings/testutils/ShadowIUsbManager.java"
        "src/com/android/car/settings/testutils/ShadowIconDrawableFactory.java"
        "src/com/android/car/settings/testutils/ShadowInputMethodManager.java"
        "src/com/android/car/settings/testutils/ShadowLocalBluetoothAdapter.java"
        "src/com/android/car/settings/testutils/ShadowLocalBroadcastManager.java"
        "src/com/android/car/settings/testutils/ShadowLocalePicker.java"
        "src/com/android/car/settings/testutils/ShadowLocaleStore.java"
        "src/com/android/car/settings/testutils/ShadowLocationManager.java"
        "src/com/android/car/settings/testutils/ShadowLockPatternUtils.java"
        "src/com/android/car/settings/testutils/ShadowNetworkPolicyEditor.java"
        "src/com/android/car/settings/testutils/ShadowNetworkPolicyManager.java"
        "src/com/android/car/settings/testutils/ShadowNotificationManager.java"
        "src/com/android/car/settings/testutils/ShadowPermissionControllerManager.java"
        "src/com/android/car/settings/testutils/ShadowRecoverySystem.java"
        "src/com/android/car/settings/testutils/ShadowRestrictedLockUtilsInternal.java"
        "src/com/android/car/settings/testutils/ShadowRingtone.java"
        "src/com/android/car/settings/testutils/ShadowRingtoneManager.java"
        "src/com/android/car/settings/testutils/ShadowSecureSettings.java"
        "src/com/android/car/settings/testutils/ShadowSmsApplication.java"
        "src/com/android/car/settings/testutils/ShadowSmsManager.java"
        "src/com/android/car/settings/testutils/ShadowStorageManagerVolumeProvider.java"
        "src/com/android/car/settings/testutils/ShadowSubscriptionManager.java"
        "src/com/android/car/settings/testutils/ShadowTelephonyManager.java"
        "src/com/android/car/settings/testutils/ShadowTextToSpeech.java"
        "src/com/android/car/settings/testutils/ShadowTtsEngines.java"
        "src/com/android/car/settings/testutils/ShadowTypeface.java"
        "src/com/android/car/settings/testutils/ShadowUidDetailProvider.java"
        "src/com/android/car/settings/testutils/ShadowUserHelper.java"
        "src/com/android/car/settings/testutils/ShadowUserIconProvider.java"
        "src/com/android/car/settings/testutils/ShadowUserManager.java"
        "src/com/android/car/settings/testutils/ShadowUtils.java"
        "src/com/android/car/settings/testutils/ShadowVoiceInteractionServiceInfo.java"
        "src/com/android/car/settings/testutils/ShadowWifiManager.java"
        "src/com/android/car/settings/tts/PreferredEngineEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/tts/PreferredEngineOptionsPreferenceControllerTest.java"
        "src/com/android/car/settings/tts/TtsPlaybackPreferenceControllerTest.java"
        "src/com/android/car/settings/tts/TtsPlaybackSettingsManagerTest.java"
        "src/com/android/car/settings/units/UnitsBasePreferenceControllerTest.java"
        "src/com/android/car/settings/users/AddNewUserTaskTest.java"
        "src/com/android/car/settings/users/BroadcastReceiverHelpers.java"
        "src/com/android/car/settings/users/ChooseNewAdminFragmentTest.java"
        "src/com/android/car/settings/users/ChooseNewAdminPreferenceControllerTest.java"
        "src/com/android/car/settings/users/EditUserNameEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/users/EditUsernameFragmentTest.java"
        "src/com/android/car/settings/users/MakeAdminPreferenceControllerTest.java"
        "src/com/android/car/settings/users/PermissionsPreferenceControllerTest.java"
        "src/com/android/car/settings/users/UserDetailsBaseFragmentTest.java"
        "src/com/android/car/settings/users/UserDetailsBasePreferenceControllerTest.java"
        "src/com/android/car/settings/users/UserDetailsFragmentTest.java"
        "src/com/android/car/settings/users/UserHelperTest.java"
        "src/com/android/car/settings/users/UserIconProviderTest.java"
        "src/com/android/car/settings/users/UsersBasePreferenceControllerTest.java"
        "src/com/android/car/settings/users/UsersListFragmentTest.java"
        "src/com/android/car/settings/users/UsersListPreferenceControllerTest.java"
        "src/com/android/car/settings/users/UsersPreferenceProviderTest.java"
        "src/com/android/car/settings/wifi/AccessPointListPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/AccessPointPreferenceTest.java"
        "src/com/android/car/settings/wifi/AddWifiFragmentTest.java"
        "src/com/android/car/settings/wifi/AddWifiPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/ButtonPasswordEditTextPreferenceTest.java"
        "src/com/android/car/settings/wifi/NetworkNamePreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/NetworkNameRestrictedPasswordEditTextPreferenceTest.java"
        "src/com/android/car/settings/wifi/NetworkPasswordPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/NetworkSecurityPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiEntryPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiRequestToggleActivityTest.java"
        "src/com/android/car/settings/wifi/WifiStatusPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherApBandPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherAutoOffPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherBasePreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherFragmentTest.java"
        "src/com/android/car/settings/wifi/WifiTetherNamePreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherPasswordPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/WifiTetherSecurityPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/details/WifiFrequencyPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/details/WifiGatewayPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/details/WifiInfoProviderTest.java"
        "src/com/android/car/settings/wifi/details/WifiMacAddressPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/details/WifiSignalStrengthPreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/preferences/CellularFallbackTogglePreferenceControllerTest.java"
        "src/com/android/car/settings/wifi/preferences/WifiWakeupTogglePreferenceControllerTest.java"
    ];

    libs = [
        "Robolectric_all-target"
        "robolectric_android-all-stub"
        "mockito-robolectric-prebuilt"
        "truth-prebuilt"
        "testng"
        "android.car"
    ];

    java_resource_dirs = ["config"];

    instrumentation_for = "CarSettingsForTesting";

    test_options = {
        timeout = 36000;
    };
};

in { inherit CarSettingsRoboTests; }

{ android_test }:
let

SettingsUnitTests = android_test {
    name = "SettingsUnitTests";

    certificate = "platform";

    libs = [
        "android.test.runner"
        "telephony-common"
        "ims-common"
        "android.test.base"
        "android.test.mock"
    ];

    static_libs = [
        "androidx.test.core"
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "androidx.test.espresso.contrib-nodeps"
        "androidx.test.espresso.intents-nodeps"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "truth-prebuilt"
        "ub-uiautomator"
    ];

    #  Include all test java files.
    srcs = [
        "src/com/android/settings/UserCredentialsTest.java"
        "src/com/android/settings/UtilsTest.java"
        "src/com/android/settings/accessibility/ToggleFeaturePreferenceFragmentTest.java"
        "src/com/android/settings/accounts/AccountsSettingsTest.java"
        "src/com/android/settings/accounts/Authenticator.java"
        "src/com/android/settings/accounts/TestAuthService.java"
        "src/com/android/settings/applications/AppOpsSettingsTest.java"
        "src/com/android/settings/applications/DrawOverlaySettingsTest.java"
        "src/com/android/settings/applications/ExternalSourcesSettingsTest.java"
        "src/com/android/settings/applications/manageapplications/ManageApplicationsUnitTest.java"
        "src/com/android/settings/backup/BackupIntentTest.java"
        "src/com/android/settings/biometrics/fingerprint/FingerprintEnrollFinishTest.java"
        "src/com/android/settings/biometrics/fingerprint/FingerprintEnrollIntroductionTest.java"
        "src/com/android/settings/bluetooth/Utf8ByteLengthFilterTest.java"
        "src/com/android/settings/core/LifecycleEventHandlingTest.java"
        "src/com/android/settings/core/PreferenceControllerContractTest.java"
        "src/com/android/settings/core/SettingsGatewayTest.java"
        "src/com/android/settings/core/UniquePreferenceTest.java"
        "src/com/android/settings/core/UserRestrictionTest.java"
        "src/com/android/settings/dashboard/FirstIdViewMatcher.java"
        "src/com/android/settings/dashboard/PreferenceThemeTest.java"
        "src/com/android/settings/dashboard/UiBlockerControllerTest.java"
        "src/com/android/settings/datetime/timezone/model/TimeZoneDataTest.java"
        "src/com/android/settings/development/BluetoothMaxConnectedAudioDevicesPreferenceControllerInstrumentationTest.java"
        "src/com/android/settings/deviceinfo/PrivateVolumeForgetTest.java"
        "src/com/android/settings/deviceinfo/PublicVolumeSettingsTest.java"
        "src/com/android/settings/deviceinfo/storage/StorageAsyncLoaderTest.java"
        "src/com/android/settings/display/NightDisplaySettingsActivityTest.java"
        "src/com/android/settings/display/ThemePreferenceControllerTest.java"
        "src/com/android/settings/fuelgauge/batterytip/RestrictAppTest.java"
        "src/com/android/settings/homepage/contextualcards/ContextualCardLoaderTest.java"
        "src/com/android/settings/network/TetherProvisioningActivityTest.java"
        "src/com/android/settings/notification/AppBubbleNotificationSettingsTest.java"
        "src/com/android/settings/notification/AppNotificationSettingsTest.java"
        "src/com/android/settings/notification/ChannelNotificationSettingsTest.java"
        "src/com/android/settings/notification/ZenModeSettingsIntegrationTest.java"
        "src/com/android/settings/password/ChooseLockGenericTest.java"
        "src/com/android/settings/password/ChooseLockPasswordTest.java"
        "src/com/android/settings/password/ConfirmLockPasswordTest.java"
        "src/com/android/settings/password/SetupChooseLockGenericTest.java"
        "src/com/android/settings/password/SetupChooseLockPasswordAppTest.java"
        "src/com/android/settings/print/PrintJobSettingsActivityTest.java"
        "src/com/android/settings/search/SearchIndexablesContractTest.java"
        "src/com/android/settings/search/SearchResultTrampolineTest.java"
        "src/com/android/settings/search/SettingsSearchIndexablesProviderTest.java"
        "src/com/android/settings/slices/SliceDataContractTest.java"
        "src/com/android/settings/tests/BluetoothRequestPermissionTest.java"
        "src/com/android/settings/tests/Manufacturer.java"
        "src/com/android/settings/tests/Operator.java"
        "src/com/android/settings/utils/FileSizeFormatterTest.java"
        "src/com/android/settings/utils/MockedServiceManager.java"
        "src/com/android/settings/vpn2/AppSettingsTest.java"
        "src/com/android/settings/vpn2/PreferenceListTest.java"
        "src/com/android/settings/wifi/SavedNetworkSettingsTest.java"
        "src/com/android/settings/wifi/WifiCallingSettingUiTest.java"
        "src/com/android/settings/wifi/WifiSettingsUiTest.java"
        "src/com/android/settings/wifi/dpp/WifiDppChooseSavedWifiNetworkFragmentTest.java"
        "src/com/android/settings/wifi/dpp/WifiDppConfiguratorActivityTest.java"
        "src/com/android/settings/wifi/dpp/WifiDppEnrolleeActivityTest.java"
        "src/com/android/settings/wifi/dpp/WifiDppQrCodeGeneratorFragmentTest.java"
        "src/com/android/settings/wifi/dpp/WifiDppQrCodeScannerFragmentTest.java"
        "src/com/android/settings/wifi/dpp/WifiNetworkListFragmentTest.java"
        "src/com/android/settings/wifi/dpp/WifiQrCodeTest.java"
        "src/com/android/settings/wifi/tether/TetherServiceTest.java"
        "src/com/android/settings/wifi/tether/WifiTetherSettingsTest.java"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    instrumentation_for = "Settings";
};

in { inherit SettingsUnitTests; }

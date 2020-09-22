{ android_app, android_test }:
let

SettingsProvider = android_app {
    name = "SettingsProvider";
    resource_dirs = ["res"];
    srcs = [
        "src/android/provider/settings/backup/DeviceSpecificSettings.java"
        "src/android/provider/settings/backup/GlobalSettings.java"
        "src/android/provider/settings/backup/SecureSettings.java"
        "src/android/provider/settings/backup/SystemSettings.java"
        "src/android/provider/settings/validators/AccessibilityShortcutTargetListValidator.java"
        "src/android/provider/settings/validators/ComponentNameListValidator.java"
        "src/android/provider/settings/validators/DiscreteValueValidator.java"
        "src/android/provider/settings/validators/GlobalSettingsValidators.java"
        "src/android/provider/settings/validators/InclusiveFloatRangeValidator.java"
        "src/android/provider/settings/validators/InclusiveIntegerRangeValidator.java"
        "src/android/provider/settings/validators/ListValidator.java"
        "src/android/provider/settings/validators/PackageNameListValidator.java"
        "src/android/provider/settings/validators/SecureSettingsValidators.java"
        "src/android/provider/settings/validators/SettingsValidators.java"
        "src/android/provider/settings/validators/SystemSettingsValidators.java"
        "src/android/provider/settings/validators/TTSListValidator.java"
        "src/android/provider/settings/validators/TileListValidator.java"
        "src/android/provider/settings/validators/Validator.java"
        "src/com/android/providers/settings/DatabaseHelper.java"
        "src/com/android/providers/settings/DeviceConfigService.java"
        "src/com/android/providers/settings/GenerationRegistry.java"
        "src/com/android/providers/settings/SettingsBackupAgent.java"
        "src/com/android/providers/settings/SettingsHelper.java"
        "src/com/android/providers/settings/SettingsProtoDumpUtil.java"
        "src/com/android/providers/settings/SettingsProvider.java"
        "src/com/android/providers/settings/SettingsService.java"
        "src/com/android/providers/settings/SettingsState.java"
        "src/com/android/providers/settings/WifiSoftApConfigChangedNotifier.java"
        "src/com/android/providers/settings/WriteFallbackSettingsFilesJobService.java"
        "src/com/android/providers/settings/EventLogTags.logtags"
    ];
    libs = [
        "telephony-common"
        "ims-common"
        "unsupportedappusage"
    ];
    static_libs = [
        "junit"
        "SettingsLibDisplayDensityUtils"
    ];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

SettingsProviderTest = android_test {
    name = "SettingsProviderTest";
    #  Note we statically link several classes to do some unit tests.  It's not accessible otherwise
    #  because this test is not an instrumentation test. (because the target runs in the system process.)
    srcs = [
        "test/src/android/provider/SettingsBackupTest.java"
        "test/src/android/provider/settings/validators/SettingsValidatorsTest.java"
        "test/src/com/android/providers/settings/BaseSettingsProviderTest.java"
        "test/src/com/android/providers/settings/DeviceConfigServiceTest.java"
        "test/src/com/android/providers/settings/InstallNonMarketAppsDeprecationTest.java"
        "test/src/com/android/providers/settings/SettingsBackupAgentTest.java"
        "test/src/com/android/providers/settings/SettingsHelperRestoreTest.java"
        "test/src/com/android/providers/settings/SettingsHelperTest.java"
        "test/src/com/android/providers/settings/SettingsProviderPerformanceTest.java"
        "test/src/com/android/providers/settings/SettingsProviderTest.java"
        "test/src/com/android/providers/settings/SettingsStateTest.java"
        "src/android/provider/settings/backup/DeviceSpecificSettings.java"
        "src/android/provider/settings/backup/GlobalSettings.java"
        "src/android/provider/settings/backup/SecureSettings.java"
        "src/android/provider/settings/backup/SystemSettings.java"
        "src/android/provider/settings/validators/AccessibilityShortcutTargetListValidator.java"
        "src/android/provider/settings/validators/ComponentNameListValidator.java"
        "src/android/provider/settings/validators/DiscreteValueValidator.java"
        "src/android/provider/settings/validators/GlobalSettingsValidators.java"
        "src/android/provider/settings/validators/InclusiveFloatRangeValidator.java"
        "src/android/provider/settings/validators/InclusiveIntegerRangeValidator.java"
        "src/android/provider/settings/validators/ListValidator.java"
        "src/android/provider/settings/validators/PackageNameListValidator.java"
        "src/android/provider/settings/validators/SecureSettingsValidators.java"
        "src/android/provider/settings/validators/SettingsValidators.java"
        "src/android/provider/settings/validators/SystemSettingsValidators.java"
        "src/android/provider/settings/validators/TTSListValidator.java"
        "src/android/provider/settings/validators/TileListValidator.java"
        "src/android/provider/settings/validators/Validator.java"
        "src/com/android/providers/settings/SettingsBackupAgent.java"
        "src/com/android/providers/settings/SettingsState.java"
        "src/com/android/providers/settings/SettingsHelper.java"
        "src/com/android/providers/settings/WifiSoftApConfigChangedNotifier.java"
    ];
    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "SettingsLibDisplayDensityUtils"
        "platform-test-annotations"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.base"
        "android.test.mock"
        "unsupportedappusage"
    ];
    resource_dirs = ["res"];
    aaptflags = [
        "--auto-add-overlay"
        "--extra-packages"
        "com.android.providers.settings"
    ];
    platform_apis = true;
    certificate = "platform";
    test_suites = ["device-tests"];
    manifest = "test/AndroidManifest.xml";
    test_config = "test/AndroidTest.xml";
};

in { inherit SettingsProvider SettingsProviderTest; }

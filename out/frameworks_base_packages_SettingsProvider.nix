{ android_app, android_test }:
let

SettingsProvider = android_app {
    name = "SettingsProvider";
    resource_dirs = ["res"];
    srcs = [
        "src/com/android/providers/settings/DatabaseHelper.java"
        "src/com/android/providers/settings/DeviceConfigService.java"
        "src/com/android/providers/settings/GenerationRegistry.java"
        "src/com/android/providers/settings/SettingsBackupAgent.java"
        "src/com/android/providers/settings/SettingsHelper.java"
        "src/com/android/providers/settings/SettingsProtoDumpUtil.java"
        "src/com/android/providers/settings/SettingsProvider.java"
        "src/com/android/providers/settings/SettingsService.java"
        "src/com/android/providers/settings/SettingsState.java"
        "src/com/android/providers/settings/EventLogTags.logtags"
    ];
    libs = [
        "telephony-common"
        "ims-common"
    ];
    static_libs = ["junit"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

SettingsProviderTest = android_test {
    name = "SettingsProviderTest";
    #  Note we statically link several classes to do some unit tests.  It's not accessible otherwise
    #  because this test is not an instrumentation test. (because the target runs in the system process.)
    srcs = [
        "test/src/com/android/providers/settings/BaseSettingsProviderTest.java"
        "test/src/com/android/providers/settings/DeviceConfigServiceTest.java"
        "test/src/com/android/providers/settings/InstallNonMarketAppsDeprecationTest.java"
        "test/src/com/android/providers/settings/SettingsHelperRestoreTest.java"
        "test/src/com/android/providers/settings/SettingsHelperTest.java"
        "test/src/com/android/providers/settings/SettingsProviderPerformanceTest.java"
        "test/src/com/android/providers/settings/SettingsProviderTest.java"
        "test/src/com/android/providers/settings/SettingsStateTest.java"
        "src/com/android/providers/settings/SettingsState.java"
        "src/com/android/providers/settings/SettingsHelper.java"
    ];
    static_libs = ["androidx.test.rules"];
    libs = ["android.test.base"];
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

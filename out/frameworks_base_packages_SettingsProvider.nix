{ android_app, android_test }:
let

SettingsProvider = android_app {
    name = "SettingsProvider";
    resource_dirs = ["res"];
    srcs = [
        "src/**/*.java"
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
        "test/**/*.java"
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

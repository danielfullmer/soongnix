{ android_test }:
let

SettingsPerfTests = android_test {
    name = "SettingsPerfTests";

    certificate = "platform";

    libs = [
        "android.test.runner"
    ];

    static_libs = [
        "androidx.test.rules"
        "ub-uiautomator"
    ];

    #  Include all test java files.
    srcs = ["src/com/android/settings/tests/perf/LaunchSettingsTest.java"];

    platform_apis = true;
    test_suites = ["device-tests"];

    instrumentation_for = "Settings";
};

in { inherit SettingsPerfTests; }

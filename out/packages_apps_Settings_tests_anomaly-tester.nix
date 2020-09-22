{ android_test }:
let

AnomalyTester = android_test {
    name = "AnomalyTester";

    certificate = "platform";

    libs = ["android.test.runner"];

    static_libs = [
        "androidx.test.rules"
        "mockito-target"
        "ub-uiautomator"
        "truth-prebuilt"
    ];

    srcs = [
        "src/com/android/settings/anomaly/tester/AnomalyActivity.java"
        "src/com/android/settings/anomaly/tester/service/AnomalyService.java"
        "src/com/android/settings/anomaly/tester/utils/AnomalyActions.java"
        "src/com/android/settings/anomaly/tester/utils/AnomalyPolicyBuilder.java"
        "src/com/android/settings/anomaly/tests/BluetoothAnomalyTest.java"
        "src/com/android/settings/anomaly/tests/TestUtils.java"
        "src/com/android/settings/anomaly/tests/WakelockAnomalyTest.java"
    ];

    optimize = {
        enabled = false;
    };

    platform_apis = true;

    instrumentation_for = "Settings";
};

in { inherit AnomalyTester; }

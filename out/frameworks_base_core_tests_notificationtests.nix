{ android_test }:
let

NotificationStressTests = android_test {
    name = "NotificationStressTests";
    #  Include all test java files.
    srcs = ["src/android/app/NotificationStressTest.java"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    #  Could build against SDK if it wasn't for the @RepetitiveTest annotation.
    platform_apis = true;
    static_libs = [
        "junit"
        "ub-uiautomator"
    ];
};

in { inherit NotificationStressTests; }

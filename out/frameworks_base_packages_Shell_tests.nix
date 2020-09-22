{ android_test }:
let

ShellTests = android_test {
    name = "ShellTests";
    srcs = [
        "src/com/android/shell/ActionSendMultipleConsumerActivity.java"
        "src/com/android/shell/BugreportProgressServiceTest.java"
        "src/com/android/shell/BugreportReceiverTest.java"
        "src/com/android/shell/UiBot.java"
        "src/com/android/shell/UtilitiesTest.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "ub-uiautomator"
        "junit"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    instrumentation_for = "Shell";
    certificate = "platform";
};

in { inherit ShellTests; }

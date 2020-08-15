{ android_test }:
let

StatusBarTest = android_test {
    name = "StatusBarTest";
    srcs = [
        "src/com/android/statusbartest/ConfirmationActivity.java"
        "src/com/android/statusbartest/NotificationBuilderTest.java"
        "src/com/android/statusbartest/NotificationTestList.java"
        "src/com/android/statusbartest/PowerTest.java"
        "src/com/android/statusbartest/StatusBarTest.java"
        "src/com/android/statusbartest/TestActivity.java"
        "src/com/android/statusbartest/TestAlertActivity.java"
        "src/com/android/statusbartest/ToastTest.java"
    ];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit StatusBarTest; }

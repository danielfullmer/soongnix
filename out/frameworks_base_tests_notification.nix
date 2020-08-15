{ android_test }:
let

NotificationTests = android_test {
    name = "NotificationTests";
    #  Include all test java files.
    srcs = ["src/com/android/frameworks/tests/notification/NotificationTests.java"];
    libs = ["android.test.runner.stubs"];
    sdk_version = "21";
};

in { inherit NotificationTests; }

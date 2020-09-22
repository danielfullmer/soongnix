{ android_test }:
let

FrameworkPermissionTests = android_test {
    name = "FrameworkPermissionTests";
    #  Include all test java files.
    srcs = [
        "src/com/android/framework/permission/tests/ActivityManagerPermissionTests.java"
        "src/com/android/framework/permission/tests/PmPermissionsTests.java"
        "src/com/android/framework/permission/tests/SmsManagerPermissionTest.java"
        "src/com/android/framework/permission/tests/VibratorServicePermissionTest.java"
        "src/com/android/framework/permission/tests/WindowManagerPermissionTests.java"
    ];
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
    ];
    static_libs = ["junit"];
    platform_apis = true;
};

in { inherit FrameworkPermissionTests; }

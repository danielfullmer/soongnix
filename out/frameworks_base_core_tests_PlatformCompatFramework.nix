{ android_test }:
let

PlatformCompatFrameworkTests = android_test {
    name = "PlatformCompatFrameworkTests";
    #  Include all test java files.
    srcs = ["src/com/android/internal/compat/ChangeReporterTest.java"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = [
        "junit"
        "androidx.test.rules"
    ];
    platform_apis = true;
};

in { inherit PlatformCompatFrameworkTests; }

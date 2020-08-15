{ android_test }:
let

AppLaunchWear = android_test {
    name = "AppLaunchWear";
    #  Only compile source java files in this apk.
    srcs = ["src/com/android/tests/applaunch/AppLaunch.java"];
    platform_apis = true;
    certificate = "platform";
    libs = [
        "android.test.base"
        "android.test.runner"
    ];
    static_libs = ["androidx.test.rules"];
    test_suites = ["device-tests"];
};

in { inherit AppLaunchWear; }

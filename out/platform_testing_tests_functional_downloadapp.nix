{ android_test }:
let

DownloadAppFunctionalTests = android_test {
    name = "DownloadAppFunctionalTests";

    sdk_version = "test_current";

    srcs = [
        "src/com/android/functional/downloadapp/DownloadAppTestHelper.java"
        "src/com/android/functional/downloadapp/DownloadAppTests.java"
    ];
    static_libs = [
        "launcher-helper-lib"
        "ub-uiautomator"
        "android-support-test"
    ];

    libs = ["android.test.base.stubs"];

    certificate = "platform";

    test_suites = ["device-tests"];
};

in { inherit DownloadAppFunctionalTests; }

{ android_test }:
let

ScreenshotHelperTests = android_test {
    name = "ScreenshotHelperTests";

    srcs = [
        "src/com/android/internal/util/ScreenshotHelperTest.java"
    ];

    static_libs = [
        "frameworks-base-testutils"
        "androidx.test.runner"
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";
};

in { inherit ScreenshotHelperTests; }

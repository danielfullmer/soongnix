{ android_test }:
let

FrameworksCoreFeatureFlagTests = android_test {
    name = "FrameworksCoreFeatureFlagTests";
    #  We only want this apk build for tests.
    #  Include all test java files.
    srcs = ["src/android/util/FeatureFlagUtilsTest.java"];
    dxflags = ["--core-library"];
    static_libs = [
        "android-common"
        "frameworks-core-util-lib"
        "androidx.test.rules"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    platform_apis = true;
    certificate = "platform";
    test_suites = ["device-tests"];
};

in { inherit FrameworksCoreFeatureFlagTests; }

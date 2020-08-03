{ android_test }:
let

FrameworksLocationTests = android_test {
    name = "FrameworksLocationTests";
    #  Include all test java files.
    srcs = ["src/**/*.java"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    platform_apis = true;
    static_libs = [
        "androidx.test.rules"
        "core-test-rules"
        "guava"
        "mockito-target-minus-junit4"
        "frameworks-base-testutils"
        "truth-prebuilt"
    ];
    test_suites = ["device-tests"];
};

in { inherit FrameworksLocationTests; }

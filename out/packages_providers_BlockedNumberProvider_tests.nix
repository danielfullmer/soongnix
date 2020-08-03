{ android_test }:
let

BlockedNumberProviderTest = android_test {
    name = "BlockedNumberProviderTest";
    static_libs = [
        "mockito-target-minus-junit4"
        "androidx.test.rules"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    test_suites = ["device-tests"];
    instrumentation_for = "BlockedNumberProvider";
    certificate = "shared";
    optimize = {
        enabled = false;
    };
};

in { inherit BlockedNumberProviderTest; }

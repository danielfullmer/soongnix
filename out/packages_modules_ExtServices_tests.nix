{ android_test }:
let

ExtServicesUnitTests = android_test {
    name = "ExtServicesUnitTests";

    #  Include all test java files.
    srcs = ["src/**/*.java"];

    #  We only want this apk build for tests.
    certificate = "platform";

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    static_libs = [
        "ExtServices-core"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "mockito-target-minus-junit4"
        "androidx.test.espresso.core"
        "truth-prebuilt"
        "testables"
        "testng"
    ];

    platform_apis = true;
};

in { inherit ExtServicesUnitTests; }

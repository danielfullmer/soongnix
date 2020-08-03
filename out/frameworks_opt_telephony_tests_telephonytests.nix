{ android_test }:
let

FrameworksTelephonyTests = android_test {
    name = "FrameworksTelephonyTests";

    srcs = ["**/*.java"];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
        "ims-common"
    ];

    static_libs = [
        "androidx.test.rules"
        "frameworks-base-testutils"
        "guava"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "services.core"
        "services.net"
        "telephony-common"
        "truth-prebuilt"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];
};

in { inherit FrameworksTelephonyTests; }

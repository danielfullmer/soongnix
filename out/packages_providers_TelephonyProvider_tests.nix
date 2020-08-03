{ android_test }:
let

TelephonyProviderTests = android_test {
    name = "TelephonyProviderTests";
    static_libs = [
        "mockito-target"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
        "android.test.mock"
    ];
    srcs = ["src/**/*.java"];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
    instrumentation_for = "TelephonyProvider";
};

in { inherit TelephonyProviderTests; }

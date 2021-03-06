{ android_test }:
let

CarrierConfigTests = android_test {
    name = "CarrierConfigTests";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    srcs = ["src/com/android/carrierconfig/CarrierConfigTest.java"];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
    instrumentation_for = "CarrierConfig";
};

in { inherit CarrierConfigTests; }

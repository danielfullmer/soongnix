{ android_test_helper_app }:
let

TestExternalImsServiceApp = android_test_helper_app {
    name = "TestExternalImsServiceApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/telephony/cts/externalimsservice/TestExternalImsService.java"
        "aidl/android/telephony/cts/externalimsservice/ITestExternalImsService.aidl"
        ":telephony-cts-ims-common-srcs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
    ];
    aidl = {
        local_include_dirs = ["aidl/"];
    };
    sdk_version = "test_current";
    test_suites = [
        "cts"
        "vts10"
        "mts"
    ];
};

in { inherit TestExternalImsServiceApp; }

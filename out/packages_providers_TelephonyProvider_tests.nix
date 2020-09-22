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
    srcs = [
        "src/com/android/providers/telephony/CarrierIdProviderTest.java"
        "src/com/android/providers/telephony/CarrierIdProviderTestable.java"
        "src/com/android/providers/telephony/CarrierProviderTest.java"
        "src/com/android/providers/telephony/CarrierProviderTestable.java"
        "src/com/android/providers/telephony/SmsProviderTest.java"
        "src/com/android/providers/telephony/SmsProviderTestable.java"
        "src/com/android/providers/telephony/TelephonyBackupAgentTest.java"
        "src/com/android/providers/telephony/TelephonyDatabaseHelperTest.java"
        "src/com/android/providers/telephony/TelephonyProviderTest.java"
        "src/com/android/providers/telephony/TelephonyProviderTestable.java"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
    instrumentation_for = "TelephonyProvider";
};

in { inherit TelephonyProviderTests; }

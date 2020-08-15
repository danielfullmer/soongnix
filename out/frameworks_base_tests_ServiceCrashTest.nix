{ android_test }:
let

ServiceCrashTest = android_test {
    name = "ServiceCrashTest";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/tests/servicecrashtest/CrashingService.java"
        "src/com/android/tests/servicecrashtest/MainActivity.java"
        "src/com/android/tests/servicecrashtest/ServiceCrashTest.java"
    ];
    platform_apis = true;
    certificate = "platform";
    libs = ["android.test.base"];
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
    ];
};

in { inherit ServiceCrashTest; }

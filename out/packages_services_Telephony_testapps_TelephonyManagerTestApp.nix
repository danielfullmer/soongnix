{ android_test }:
let

TelephonyManagerTestApp = android_test {
    name = "TelephonyManagerTestApp";
    srcs = [
        "src/com/android/phone/testapps/telephonymanagertestapp/CallingMethodActivity.java"
        "src/com/android/phone/testapps/telephonymanagertestapp/ParameterParser.java"
        "src/com/android/phone/testapps/telephonymanagertestapp/TelephonyManagerTestApp.java"
    ];
    javacflags = ["-parameters"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit TelephonyManagerTestApp; }

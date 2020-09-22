{ android_app }:
let

SmsManagerTestApp = android_app {
    name = "SmsManagerTestApp";
    srcs = [
        "src/com/android/phone/testapps/smsmanagertestapp/SendStatusReceiver.java"
        "src/com/android/phone/testapps/smsmanagertestapp/SmsManagerTestApp.java"
        "src/com/android/phone/testapps/smsmanagertestapp/SmsManagerTestService.java"
    ];
    sdk_version = "current";
};

in { inherit SmsManagerTestApp; }

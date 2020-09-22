{ android_app }:
let

ImsTestApp = android_app {
    name = "ImsTestApp";
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
        "androidx.cardview_cardview"
    ];
    srcs = [
        "src/com/android/phone/testapps/imstestapp/ImsCallingActivity.java"
        "src/com/android/phone/testapps/imstestapp/ImsConfigActivity.java"
        "src/com/android/phone/testapps/imstestapp/ImsRegistrationActivity.java"
        "src/com/android/phone/testapps/imstestapp/ImsTestServiceApp.java"
        "src/com/android/phone/testapps/imstestapp/TestImsConfigImpl.java"
        "src/com/android/phone/testapps/imstestapp/TestImsRegistrationImpl.java"
        "src/com/android/phone/testapps/imstestapp/TestImsService.java"
        "src/com/android/phone/testapps/imstestapp/TestImsSmsImpl.java"
        "src/com/android/phone/testapps/imstestapp/TestMmTelFeatureImpl.java"
        "src/com/android/phone/testapps/imstestapp/TestRcsFeatureImpl.java"
    ];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

in { inherit ImsTestApp; }

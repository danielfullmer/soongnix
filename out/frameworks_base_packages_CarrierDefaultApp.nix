{ android_app }:
let

CarrierDefaultApp = android_app {
    name = "CarrierDefaultApp";
    srcs = [
        "src/com/android/carrierdefaultapp/CaptivePortalLoginActivity.java"
        "src/com/android/carrierdefaultapp/CarrierActionUtils.java"
        "src/com/android/carrierdefaultapp/CarrierDefaultBroadcastReceiver.java"
        "src/com/android/carrierdefaultapp/CustomConfigLoader.java"
        "src/com/android/carrierdefaultapp/ProvisionObserver.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit CarrierDefaultApp; }

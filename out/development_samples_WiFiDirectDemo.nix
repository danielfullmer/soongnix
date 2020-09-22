{ android_app }:
let

WiFiDirectDemo = android_app {
    name = "WiFiDirectDemo";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/wifidirect/DeviceDetailFragment.java"
        "src/com/example/android/wifidirect/DeviceListFragment.java"
        "src/com/example/android/wifidirect/FileTransferService.java"
        "src/com/example/android/wifidirect/WiFiDirectActivity.java"
        "src/com/example/android/wifidirect/WiFiDirectBroadcastReceiver.java"
    ];
    static_libs = ["android-support-v4"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit WiFiDirectDemo; }

{ android_app }:
let

WiFiDirectServiceDiscovery = android_app {
    name = "WiFiDirectServiceDiscovery";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/wifidirect/discovery/ChatManager.java"
        "src/com/example/android/wifidirect/discovery/ClientSocketHandler.java"
        "src/com/example/android/wifidirect/discovery/GroupOwnerSocketHandler.java"
        "src/com/example/android/wifidirect/discovery/WiFiChatFragment.java"
        "src/com/example/android/wifidirect/discovery/WiFiDirectBroadcastReceiver.java"
        "src/com/example/android/wifidirect/discovery/WiFiDirectServicesList.java"
        "src/com/example/android/wifidirect/discovery/WiFiP2pService.java"
        "src/com/example/android/wifidirect/discovery/WiFiServiceDiscoveryActivity.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit WiFiDirectServiceDiscovery; }

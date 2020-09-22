{ android_app }:
let

BluetoothChat = android_app {
    name = "BluetoothChat";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/BluetoothChat/BluetoothChat.java"
        "src/com/example/android/BluetoothChat/BluetoothChatService.java"
        "src/com/example/android/BluetoothChat/DeviceListActivity.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit BluetoothChat; }

{ android_app }:
let

BluetoothDebug = android_app {
    name = "BluetoothDebug";
    srcs = ["src/com/android/bluetoothdebug/DebugReceiver.java"];
    platform_apis = true;
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit BluetoothDebug; }

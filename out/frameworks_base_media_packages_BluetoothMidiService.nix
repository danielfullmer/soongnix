{ android_app }:
let

BluetoothMidiService = android_app {
    name = "BluetoothMidiService";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit BluetoothMidiService; }

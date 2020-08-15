{ android_app }:
let

BluetoothMidiService = android_app {
    name = "BluetoothMidiService";
    srcs = [
        "src/com/android/bluetoothmidiservice/BluetoothMidiDevice.java"
        "src/com/android/bluetoothmidiservice/BluetoothMidiService.java"
        "src/com/android/bluetoothmidiservice/BluetoothPacketDecoder.java"
        "src/com/android/bluetoothmidiservice/BluetoothPacketEncoder.java"
        "src/com/android/bluetoothmidiservice/MidiBtleTimeTracker.java"
        "src/com/android/bluetoothmidiservice/PacketDecoder.java"
        "src/com/android/bluetoothmidiservice/PacketEncoder.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit BluetoothMidiService; }

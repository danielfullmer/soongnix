{ cc_test }:
let

VtsHalBluetoothAudioV2_0TargetTest = cc_test {
    name = "VtsHalBluetoothAudioV2_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalBluetoothAudioV2_0TargetTest.cpp"];
    static_libs = [
        "android.hardware.audio.common@5.0"
        "android.hardware.bluetooth.audio@2.0"
    ];
    shared_libs = [
        "libfmq"
    ];
};

in { inherit VtsHalBluetoothAudioV2_0TargetTest; }

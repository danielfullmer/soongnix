{ android_test }:
let

BluetoothTests = android_test {
    name = "BluetoothTests";
    #  Include all test java files.
    srcs = [
        "src/android/bluetooth/BluetoothCodecConfigTest.java"
        "src/android/bluetooth/BluetoothCodecStatusTest.java"
        "src/android/bluetooth/BluetoothInstrumentation.java"
        "src/android/bluetooth/BluetoothRebootStressTest.java"
        "src/android/bluetooth/BluetoothStressTest.java"
        "src/android/bluetooth/BluetoothTestRunner.java"
        "src/android/bluetooth/BluetoothTestUtils.java"
        "src/android/bluetooth/BluetoothUuidTest.java"
        "src/android/bluetooth/le/AdvertiseDataTest.java"
        "src/android/bluetooth/le/ScanFilterTest.java"
        "src/android/bluetooth/le/ScanRecordTest.java"
        "src/android/bluetooth/le/ScanResultTest.java"
        "src/android/bluetooth/le/ScanSettingsTest.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit BluetoothTests; }

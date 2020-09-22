{ android_app }:
let

AdbTest = android_app {
    name = "AdbTest";
    srcs = [
        "src/com/android/adb/AdbDevice.java"
        "src/com/android/adb/AdbMessage.java"
        "src/com/android/adb/AdbSocket.java"
        "src/com/android/adb/AdbTestActivity.java"
    ];
    sdk_version = "current";
};

in { inherit AdbTest; }

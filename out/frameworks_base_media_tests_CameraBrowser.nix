{ android_test }:
let

CameraBrowser = android_test {
    name = "CameraBrowser";
    srcs = [
        "src/com/android/camerabrowser/CameraBrowser.java"
        "src/com/android/camerabrowser/CameraBrowserApplication.java"
        "src/com/android/camerabrowser/DeviceDisconnectedReceiver.java"
        "src/com/android/camerabrowser/MtpClient.java"
        "src/com/android/camerabrowser/ObjectBrowser.java"
        "src/com/android/camerabrowser/ObjectViewer.java"
        "src/com/android/camerabrowser/StorageBrowser.java"
    ];
    sdk_version = "current";
};

in { inherit CameraBrowser; }

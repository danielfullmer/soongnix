{ android_app }:
let

PMC = android_app {
    name = "PMC";
    platform_apis = true;
    certificate = "platform";
    dex_preopt = {
        enabled = false;
    };
    srcs = [
        "src/com/android/pmc/A2dpReceiver.java"
        "src/com/android/pmc/BleScanReceiver.java"
        "src/com/android/pmc/GattClientListener.java"
        "src/com/android/pmc/GattPMCReceiver.java"
        "src/com/android/pmc/GattServer.java"
        "src/com/android/pmc/IperfClient.java"
        "src/com/android/pmc/PMCMainActivity.java"
        "src/com/android/pmc/PMCStatusLogger.java"
        "src/com/android/pmc/SettingActivity.java"
        "src/com/android/pmc/WifiConnScanReceiver.java"
        "src/com/android/pmc/WifiDownloadReceiver.java"
        "src/com/android/pmc/WifiGScanReceiver.java"
    ];
    resource_dirs = ["res"];
    privileged = true;
    optimize = {
        enabled = false;
    };
};

in { inherit PMC; }

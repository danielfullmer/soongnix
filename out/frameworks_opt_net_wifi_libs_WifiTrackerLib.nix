{ android_library }:
let

WifiTrackerLib = android_library {
    name = "WifiTrackerLib";
    srcs = [
        "src/com/android/wifitrackerlib/BaseWifiTracker.java"
        "src/com/android/wifitrackerlib/NetworkDetailsTracker.java"
        "src/com/android/wifitrackerlib/NetworkRequestEntry.java"
        "src/com/android/wifitrackerlib/OsuWifiEntry.java"
        "src/com/android/wifitrackerlib/PasspointNetworkDetailsTracker.java"
        "src/com/android/wifitrackerlib/PasspointWifiEntry.java"
        "src/com/android/wifitrackerlib/SavedNetworkTracker.java"
        "src/com/android/wifitrackerlib/ScanResultUpdater.java"
        "src/com/android/wifitrackerlib/StandardNetworkDetailsTracker.java"
        "src/com/android/wifitrackerlib/StandardWifiEntry.java"
        "src/com/android/wifitrackerlib/Utils.java"
        "src/com/android/wifitrackerlib/WifiEntry.java"
        "src/com/android/wifitrackerlib/WifiPickerTracker.java"
    ];
    static_libs = [
        "androidx.preference_preference"
        "SettingsLibHelpUtils"
    ];

    min_sdk_version = "21";
};

in { inherit WifiTrackerLib; }

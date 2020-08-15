{ android_app }:
let

#  Copyright 2011 The Android Open Source Project

CellBroadcastReceiver = android_app {
    name = "CellBroadcastReceiver";
    srcs = [
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertAudio.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertDialog.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertReminder.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertService.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertWakeLock.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAreaInfoReceiver.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastBackupAgent.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastChannelManager.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastConfigService.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastContentProvider.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastCursorAdapter.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastDatabaseHelper.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastListActivity.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastListItem.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastOptOutActivity.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastReceiver.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastReceiverApp.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastResources.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastSearchIndexableProvider.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastSettings.java"
        "src/com/android/cellbroadcastreceiver/PrivilegedCellBroadcastReceiver.java"
    ];
    libs = ["telephony-common"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    resource_dirs = ["res"];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "androidx.legacy_legacy-support-v13"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-preference-v14"
    ];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    defaults = ["SettingsLibDefaults"];
};

in { inherit CellBroadcastReceiver; }

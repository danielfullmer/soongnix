{ android_app, filegroup, java_defaults }:
let

#  Copyright 2011 The Android Open Source Project
CellBroadcastCommon = java_defaults {
    name = "CellBroadcastCommon";
    min_sdk_version = "29";
    sdk_version = "system_current";
    privileged = true;
    srcs = [
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertAudio.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertDialog.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertReminder.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertService.java"
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
        ":framework-annotations"
        ":cellbroadcast-constants-shared-srcs"
        ":statslog-cellbroadcast-java-gen"
    ];
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
    resource_dirs = ["res"];
    plugins = ["java_api_finder"];
};

CellBroadcastApp = android_app {
    name = "CellBroadcastApp";
    defaults = ["CellBroadcastCommon"];
    certificate = "networkstack";
    aaptflags = ["--custom-package com.android.cellbroadcastreceiver"];
    manifest = "AndroidManifest.xml";
    apex_available = ["com.android.cellbroadcast"];
};

#  filegroup used to include source into unit tests
cellbroadcastreceiver-sources = filegroup {
    name = "cellbroadcastreceiver-sources";
    srcs = [
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertAudio.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertDialog.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertReminder.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertService.java"
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
        ":framework-annotations"
        ":cellbroadcast-constants-shared-srcs"
    ];
};

CellBroadcastAppPlatform = android_app {
    name = "CellBroadcastAppPlatform";
    defaults = ["CellBroadcastCommon"];
    certificate = "platform";
    #  CellBroadcastAppPlatform is a replacement for com.android.cellbroadcast apex which consists
    #  of CellBroadcastApp
    overrides = [
        "com.android.cellbroadcast"
        "CellBroadcastLegacyApp"
    ];
    manifest = "AndroidManifest_Platform.xml";
    system_ext_specific = true;
    privileged = true;
    required = ["privapp_whitelist_com.android.cellbroadcastreceiver"];
};

#  source file shared with legacy cellbroadcast app
cellbroadcast-database-sources = filegroup {
    name = "cellbroadcast-database-sources";
    srcs = [
        "src/com/android/cellbroadcastreceiver/CellBroadcastDatabaseHelper.java"
    ];
};

in { inherit CellBroadcastApp CellBroadcastAppPlatform CellBroadcastCommon cellbroadcast-database-sources cellbroadcastreceiver-sources; }

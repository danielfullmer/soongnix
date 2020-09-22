{ android_app }:
let

#  Copyright 2020 The Android Open Source Project
#  legacy app only used to preserve data and migrate to CellBroadcastApp.
#  This will not be part of the Cellbroadcast mainline module.
#  The app is included to system img by default. If OEMs have their own legacy
#  app they can replace this one. If OEMs don't care about data loss or data
#  migration complete, OEMs can remove this app going forward.
CellBroadcastLegacyApp = android_app {
    name = "CellBroadcastLegacyApp";
    manifest = "AndroidManifest.xml";
    certificate = "platform";

    static_libs = [
        "androidx.appcompat_appcompat"
    ];

    libs = ["app-compat-annotations"];

    srcs = [

        "src/com/android/cellbroadcastreceiver/LegacyCellBroadcastContentProvider.java"
        ":framework-annotations"
        ":cellbroadcast-database-sources"
    ];
    privileged = true;
    sdk_version = "system_current";
};

in { inherit CellBroadcastLegacyApp; }

{ android_app }:
let

#  Copyright 2011 The Android Open Source Project

CellBroadcastReceiver = android_app {
    name = "CellBroadcastReceiver";
    srcs = ["src/**/*.java"];
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

{ android_app }:
let

#  Copyright 2007-2008 The Android Open Source Project

WAPPushManager = android_app {
    name = "WAPPushManager";
    srcs = ["src/com/android/smspush/WapPushManager.java"];
    platform_apis = true;
    libs = ["telephony-common"];
    static_libs = ["android-common"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit WAPPushManager; }

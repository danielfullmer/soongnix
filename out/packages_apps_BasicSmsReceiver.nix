{ android_app }:
let

#  Copyright 2007-2011 The Android Open Source Project
BasicSmsReceiver = android_app {
    name = "BasicSmsReceiver";
    libs = ["telephony-common"];
    srcs = ["src/**/*.java"];
    platform_apis = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit BasicSmsReceiver; }

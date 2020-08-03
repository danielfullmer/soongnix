{ android_app }:
let

#  Copyright 2007-2008 The Android Open Source Project

Stk = android_app {
    name = "Stk";
    libs = ["telephony-common"];
    static_libs = ["android-support-v4"];
    srcs = ["**/*.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit Stk; }

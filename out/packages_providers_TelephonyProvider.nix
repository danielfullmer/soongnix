{ android_app }:
let

TelephonyProvider = android_app {
    name = "TelephonyProvider";
    privileged = true;
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    libs = ["telephony-common"];
    static_libs = ["android-common"];
};

in { inherit TelephonyProvider; }

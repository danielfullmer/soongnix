{ android_app }:
let

ToyVpn = android_app {
    name = "ToyVpn";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/toyvpn/ToyVpnClient.java"
        "src/com/example/android/toyvpn/ToyVpnConnection.java"
        "src/com/example/android/toyvpn/ToyVpnService.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit ToyVpn; }

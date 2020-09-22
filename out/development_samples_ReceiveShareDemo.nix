{ android_app }:
let

ReceiveShareDemo = android_app {
    name = "ReceiveShareDemo";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/receiveshare/ReceiveShare.java"
        "src/com/example/android/receiveshare/ReceiveShareService.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit ReceiveShareDemo; }

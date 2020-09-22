{ android_app }:
let

KeyChainDemo = android_app {
    name = "KeyChainDemo";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/keychain/KeyChainDemoActivity.java"
        "src/com/example/android/keychain/SecureWebServer.java"
        "src/com/example/android/keychain/SecureWebServerService.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit KeyChainDemo; }

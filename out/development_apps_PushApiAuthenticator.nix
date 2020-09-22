{ android_app_certificate, android_test }:
let

development_apps_pushapiauthenticator = android_app_certificate {
    name = "development_apps_pushapiauthenticator";
    certificate = "cert";
};

PushApiAuthenticator = android_test {
    name = "PushApiAuthenticator";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/pushapiauthenticator/MainActivity.java"
        "src/com/example/android/pushapiauthenticator/MessageReceiver.java"
        "src/com/example/android/pushapiauthenticator/MyAccountAuthenticator.java"
        "src/com/example/android/pushapiauthenticator/MyAccountAuthenticatorService.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
    certificate = ":development_apps_pushapiauthenticator";
};

in { inherit PushApiAuthenticator development_apps_pushapiauthenticator; }

{ android_app_certificate, android_test }:
let

development_apps_pushapitestappone_cert = android_app_certificate {
    name = "development_apps_pushapitestappone_cert";
    certificate = "cert";
};

PushApiTestAppOne = android_test {
    name = "PushApiTestAppOne";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/pushapithirdpartyone/MainActivity.java"
        "src/com/example/android/pushapithirdpartyone/MessageReceiver.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
    certificate = ":development_apps_pushapitestappone_cert";
};

in { inherit PushApiTestAppOne development_apps_pushapitestappone_cert; }

{ android_app_certificate, android_test }:
let

development_apps_pushapitestapptwo_cert = android_app_certificate {
    name = "development_apps_pushapitestapptwo_cert";
    certificate = "cert";
};

PushApiTestAppTwo = android_test {
    name = "PushApiTestAppTwo";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/pushapithirdpartytwo/MainActivity.java"
        "src/com/example/android/pushapithirdpartytwo/MessageReceiver.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
    certificate = ":development_apps_pushapitestapptwo_cert";
};

in { inherit PushApiTestAppTwo development_apps_pushapitestapptwo_cert; }

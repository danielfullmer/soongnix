{ android_app }:
let

SipDemo = android_app {
    name = "SipDemo";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/sip/IncomingCallReceiver.java"
        "src/com/example/android/sip/SipSettings.java"
        "src/com/example/android/sip/WalkieTalkieActivity.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit SipDemo; }

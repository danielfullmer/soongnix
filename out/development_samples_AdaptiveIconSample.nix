{ android_app }:
let

AdaptiveIconSample = android_app {
    name = "AdaptiveIconSample";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/maskableicon/Activity1.java"
        "src/com/example/android/maskableicon/Activity2.java"
        "src/com/example/android/maskableicon/Activity3.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit AdaptiveIconSample; }

{ android_app }:
let

LunarLander = android_app {
    name = "LunarLander";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/lunarlander/LunarLander.java"
        "src/com/example/android/lunarlander/LunarView.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit LunarLander; }

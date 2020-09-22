{ android_app }:
let

HelloActivity = android_app {
    name = "HelloActivity";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/helloactivity/HelloActivity.java"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit HelloActivity; }

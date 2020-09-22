{ android_app }:
let

Compass = android_app {
    name = "Compass";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/compass/CompassActivity.java"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit Compass; }

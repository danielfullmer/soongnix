{ android_app }:
let

ObbApp = android_app {
    name = "ObbApp";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/obbapp/ObbMountActivity.java"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit ObbApp; }

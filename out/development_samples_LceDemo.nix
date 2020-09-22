{ android_app }:
let

LceDemo = android_app {
    name = "LceDemo";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/lce/LceDemoActivity.java"];
    sdk_version = "current";
};

in { inherit LceDemo; }

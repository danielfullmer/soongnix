{ android_app }:
let

Protips = android_app {
    name = "Protips";
    #  Only compile source java files in this apk.
    srcs = ["src/com/android/protips/ProtipWidget.java"];
    sdk_version = "current";
};

in { inherit Protips; }

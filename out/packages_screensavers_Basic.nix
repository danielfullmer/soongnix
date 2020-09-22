{ android_app }:
let

BasicDreams = android_app {
    name = "BasicDreams";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/dreams/basic/Colors.java"
        "src/com/android/dreams/basic/ColorsGLRenderer.java"
    ];
    sdk_version = "current";
};

in { inherit BasicDreams; }

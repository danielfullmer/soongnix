{ android_app }:
let

MultiWindow = android_app {
    name = "MultiWindow";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/multiwindow/CaptionOverlayActivity.java"
        "src/com/example/android/multiwindow/LaunchingAdjacentActivity.java"
    ];
    sdk_version = "current";
};

in { inherit MultiWindow; }

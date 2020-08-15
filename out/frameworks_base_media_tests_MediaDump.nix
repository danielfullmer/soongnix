{ android_app }:
let

MediaDump = android_app {
    name = "MediaDump";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/mediadump/MediaDump.java"
        "src/com/android/mediadump/RgbPlayerActivity.java"
        "src/com/android/mediadump/VideoDumpActivity.java"
        "src/com/android/mediadump/VideoDumpView.java"
    ];
    sdk_version = "current";
};

in { inherit MediaDump; }

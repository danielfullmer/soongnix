{ android_app }:
let

Music = android_app {
    name = "Music";
    srcs = [
        "src/com/android/music/AudioPreview.java"
        "src/com/android/music/MediaPlaybackService.java"
        "src/com/android/music/MusicBrowserActivity.java"
        "src/com/android/music/MusicPicker.java"
    ];
    sdk_version = "current";
    product_specific = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit Music; }

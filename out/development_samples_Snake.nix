{ android_app }:
let

Snake = android_app {
    name = "Snake";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/snake/BackgroundView.java"
        "src/com/example/android/snake/Snake.java"
        "src/com/example/android/snake/SnakeView.java"
        "src/com/example/android/snake/TileView.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit Snake; }

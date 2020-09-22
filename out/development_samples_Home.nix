{ android_app }:
let

Home = android_app {
    name = "Home";
    srcs = [
        "src/com/example/android/home/ApplicationInfo.java"
        "src/com/example/android/home/ApplicationsStackLayout.java"
        "src/com/example/android/home/Home.java"
        "src/com/example/android/home/Wallpaper.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit Home; }

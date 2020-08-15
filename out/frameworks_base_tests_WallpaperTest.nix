{ android_app }:
let

WallpaperTest = android_app {
    name = "WallpaperTest";
    srcs = [
        "src/com/example/wallpapertest/MainActivity.java"
        "src/com/example/wallpapertest/TestWallpaper.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    optimize = {
        enabled = false;
    };
};

in { inherit WallpaperTest; }

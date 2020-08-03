{ android_app }:
let

WallpaperTest = android_app {
    name = "WallpaperTest";
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    platform_apis = true;
    optimize = {
        enabled = false;
    };
};

in { inherit WallpaperTest; }

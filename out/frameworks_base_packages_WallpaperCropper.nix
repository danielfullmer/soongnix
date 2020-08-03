{ android_app }:
let

WallpaperCropper = android_app {
    name = "WallpaperCropper";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    product_specific = true;
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit WallpaperCropper; }

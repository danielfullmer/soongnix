{ android_library }:
let

WallpaperSharedLib = android_library {

    name = "WallpaperSharedLib";
    srcs = [
        "WallpaperService.java"
        "WallpaperSettingsActivity.java"
        "IWallpaperConnection.aidl"
        "IWallpaperEngine.aidl"
        "IWallpaperService.aidl"
    ];

    libs = ["unsupportedappusage"];

    #  Enforce that the library is built against java 8 so that there are
    #  no compatibility issues with launcher
    java_version = "1.8";
};

in { inherit WallpaperSharedLib; }

{ android_library }:
let

SettingsLibTile = android_library {
    name = "SettingsLibTile";

    srcs = [
        "src/com/android/settingslib/drawer/DashboardCategory.java"
        "src/com/android/settingslib/drawer/Tile.java"
        "src/com/android/settingslib/drawer/TileUtils.java"
    ];

    static_libs = [
        "androidx.annotation_annotation"
    ];

    min_sdk_version = "21";
};

in { inherit SettingsLibTile; }

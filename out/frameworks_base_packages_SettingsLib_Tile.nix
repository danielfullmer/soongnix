{ android_library }:
let

SettingsLibTile = android_library {
    name = "SettingsLibTile";

    srcs = [
        "src/com/android/settingslib/drawer/ActivityTile.java"
        "src/com/android/settingslib/drawer/DashboardCategory.java"
        "src/com/android/settingslib/drawer/DynamicSummary.java"
        "src/com/android/settingslib/drawer/DynamicTitle.java"
        "src/com/android/settingslib/drawer/MasterSwitchController.java"
        "src/com/android/settingslib/drawer/ProviderIcon.java"
        "src/com/android/settingslib/drawer/ProviderTile.java"
        "src/com/android/settingslib/drawer/SwitchController.java"
        "src/com/android/settingslib/drawer/SwitchesProvider.java"
        "src/com/android/settingslib/drawer/Tile.java"
        "src/com/android/settingslib/drawer/TileUtils.java"
    ];

    static_libs = [
        "androidx.annotation_annotation"
    ];

    min_sdk_version = "21";
};

in { inherit SettingsLibTile; }

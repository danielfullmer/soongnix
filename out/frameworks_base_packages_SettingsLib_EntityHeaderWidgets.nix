{ android_library }:
let

SettingsLibEntityHeaderWidgets = android_library {
    name = "SettingsLibEntityHeaderWidgets";

    srcs = [
        "src/com/android/settingslib/widget/AppEntitiesHeaderController.java"
        "src/com/android/settingslib/widget/AppEntityInfo.java"
    ];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.annotation_annotation"
        "SettingsLibSettingsTheme"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibEntityHeaderWidgets; }

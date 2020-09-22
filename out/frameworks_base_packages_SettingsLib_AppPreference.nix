{ android_library }:
let

SettingsLibAppPreference = android_library {
    name = "SettingsLibAppPreference";

    srcs = ["src/com/android/settingslib/widget/apppreference/AppPreference.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.preference_preference"
        "SettingsLibSettingsTheme"
    ];
    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibAppPreference; }

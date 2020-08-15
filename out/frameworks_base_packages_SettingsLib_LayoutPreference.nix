{ android_library }:
let

SettingsLibLayoutPreference = android_library {
    name = "SettingsLibLayoutPreference";

    srcs = ["src/com/android/settingslib/widget/LayoutPreference.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.preference_preference"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibLayoutPreference; }

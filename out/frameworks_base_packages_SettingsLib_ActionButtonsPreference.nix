{ android_library }:
let

SettingsLibActionButtonsPreference = android_library {
    name = "SettingsLibActionButtonsPreference";

    srcs = ["src/com/android/settingslib/widget/ActionButtonsPreference.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.preference_preference"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibActionButtonsPreference; }

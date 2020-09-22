{ android_library }:
let

SettingsLibRadioButtonPreference = android_library {
    name = "SettingsLibRadioButtonPreference";

    srcs = ["src/com/android/settingslib/widget/RadioButtonPreference.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.preference_preference"
        "SettingsLibSettingsTheme"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibRadioButtonPreference; }

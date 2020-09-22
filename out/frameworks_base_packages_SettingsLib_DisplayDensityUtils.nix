{ android_library }:
let

SettingsLibDisplayDensityUtils = android_library {
    name = "SettingsLibDisplayDensityUtils";

    srcs = ["src/com/android/settingslib/display/DisplayDensityConfiguration.java"];

    min_sdk_version = "21";
};

in { inherit SettingsLibDisplayDensityUtils; }

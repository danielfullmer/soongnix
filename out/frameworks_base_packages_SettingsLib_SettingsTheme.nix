{ android_library }:
let

SettingsLibSettingsTheme = android_library {
    name = "SettingsLibSettingsTheme";

    resource_dirs = ["res"];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibSettingsTheme; }

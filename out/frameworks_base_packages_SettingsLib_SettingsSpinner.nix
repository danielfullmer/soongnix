{ android_library }:
let

SettingsLibSettingsSpinner = android_library {
    name = "SettingsLibSettingsSpinner";

    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibSettingsSpinner; }

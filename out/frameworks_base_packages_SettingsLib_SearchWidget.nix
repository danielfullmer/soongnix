{ android_library }:
let

SettingsLibSearchWidget = android_library {
    name = "SettingsLibSearchWidget";

    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibSearchWidget; }

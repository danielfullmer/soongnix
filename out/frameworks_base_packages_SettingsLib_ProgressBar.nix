{ android_library }:
let

SettingsLibProgressBar = android_library {
    name = "SettingsLibProgressBar";

    srcs = [];
    resource_dirs = ["res"];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibProgressBar; }

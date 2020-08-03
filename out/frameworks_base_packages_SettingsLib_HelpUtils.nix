{ android_library }:
let

SettingsLibHelpUtils = android_library {
    name = "SettingsLibHelpUtils";

    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibHelpUtils; }

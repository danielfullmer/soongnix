{ android_library }:
let

SettingsLibBarChartPreference = android_library {
    name = "SettingsLibBarChartPreference";

    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.preference_preference"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibBarChartPreference; }

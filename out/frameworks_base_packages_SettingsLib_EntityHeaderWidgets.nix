{ android_library }:
let

SettingsLibEntityHeaderWidgets = android_library {
    name = "SettingsLibEntityHeaderWidgets";

    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.annotation_annotation"
        "SettingsLibAppPreference"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibEntityHeaderWidgets; }

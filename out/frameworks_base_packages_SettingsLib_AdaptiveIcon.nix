{ android_library }:
let

SettingsLibAdaptiveIcon = android_library {
    name = "SettingsLibAdaptiveIcon";

    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.annotation_annotation"
        "SettingsLibTile"
    ];

    min_sdk_version = "21";
};

in { inherit SettingsLibAdaptiveIcon; }

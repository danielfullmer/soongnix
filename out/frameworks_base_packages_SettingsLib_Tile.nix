{ android_library }:
let

SettingsLibTile = android_library {
    name = "SettingsLibTile";

    srcs = ["src/**/*.java"];

    static_libs = [
        "androidx.annotation_annotation"
    ];

    min_sdk_version = "21";
};

in { inherit SettingsLibTile; }

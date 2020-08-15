{ android_library }:
let

SettingsLibActionBarShadow = android_library {
    name = "SettingsLibActionBarShadow";

    srcs = ["src/com/android/settingslib/widget/ActionBarShadowController.java"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.recyclerview_recyclerview"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibActionBarShadow; }

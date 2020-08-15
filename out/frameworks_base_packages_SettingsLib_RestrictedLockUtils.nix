{ android_library }:
let

SettingsLibRestrictedLockUtils = android_library {
    name = "SettingsLibRestrictedLockUtils";

    srcs = ["src/com/android/settingslib/RestrictedLockUtils.java"];
    resource_dirs = ["res"];

    libs = [
        "androidx.annotation_annotation"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibRestrictedLockUtils; }

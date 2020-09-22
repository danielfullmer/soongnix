{ android_library }:
let

SettingsLibUtils = android_library {
    name = "SettingsLibUtils";

    srcs = ["src/com/android/settingslib/utils/applications/AppUtils.java"];
    resource_dirs = ["res"];

    sdk_version = "system_current";
    min_sdk_version = "21";

    apex_available = [

        "//apex_available:platform"
        "com.android.permission"
    ];
};

in { inherit SettingsLibUtils; }

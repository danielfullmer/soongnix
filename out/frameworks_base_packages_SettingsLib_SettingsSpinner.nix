{ android_library }:
let

SettingsLibSettingsSpinner = android_library {
    name = "SettingsLibSettingsSpinner";

    srcs = [
        "src/com/android/settingslib/widget/settingsspinner/SettingsSpinner.java"
        "src/com/android/settingslib/widget/settingsspinner/SettingsSpinnerAdapter.java"
    ];
    resource_dirs = ["res"];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibSettingsSpinner; }

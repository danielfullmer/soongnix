{ android_library }:
let

SettingsLibBarChartPreference = android_library {
    name = "SettingsLibBarChartPreference";

    srcs = [
        "src/com/android/settingslib/widget/BarChartInfo.java"
        "src/com/android/settingslib/widget/BarChartPreference.java"
        "src/com/android/settingslib/widget/BarView.java"
        "src/com/android/settingslib/widget/BarViewInfo.java"
    ];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.preference_preference"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibBarChartPreference; }

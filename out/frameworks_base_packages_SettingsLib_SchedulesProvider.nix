{ android_library }:
let

SettingsLibSchedulesProvider = android_library {
    name = "SettingsLibSchedulesProvider";

    srcs = [
        "src/com/android/settingslib/schedulesprovider/ScheduleInfo.java"
        "src/com/android/settingslib/schedulesprovider/SchedulesProvider.java"
    ];

    static_libs = [
        "androidx.annotation_annotation"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibSchedulesProvider; }

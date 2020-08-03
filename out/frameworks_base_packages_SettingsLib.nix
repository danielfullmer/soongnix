{ android_library, java_defaults }:
let

SettingsLib = android_library {

    name = "SettingsLib";

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.legacy_legacy-support-v4"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.mediarouter_mediarouter-nodeps"

        "SettingsLibHelpUtils"
        "SettingsLibRestrictedLockUtils"
        "SettingsLibActionBarShadow"
        "SettingsLibAppPreference"
        "SettingsLibSearchWidget"
        "SettingsLibSettingsSpinner"
        "SettingsLibLayoutPreference"
        "SettingsLibActionButtonsPreference"
        "SettingsLibEntityHeaderWidgets"
        "SettingsLibBarChartPreference"
        "SettingsLibProgressBar"
        "SettingsLibAdaptiveIcon"
    ];

    #  ANDROIDMK TRANSLATION ERROR: unsupported assignment to LOCAL_SHARED_JAVA_LIBRARIES
    #  LOCAL_SHARED_JAVA_LIBRARIES := androidx.lifecycle_lifecycle-common

    resource_dirs = ["res"];

    srcs = [
        "src/**/*.java"
        "src/**/*.kt"
    ];

    min_sdk_version = "21";

};

#  NOTE: Keep this module in sync with ./common.mk
SettingsLibDefaults = java_defaults {
    name = "SettingsLibDefaults";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.lifecycle_lifecycle-common"
        "androidx.legacy_legacy-support-v4"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-preference-v14"
        "SettingsLib"
    ];
};

in { inherit SettingsLib SettingsLibDefaults; }

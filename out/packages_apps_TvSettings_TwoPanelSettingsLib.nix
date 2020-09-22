{ android_library, genrule, java_library }:
let

statslog-tvsettings-java-gen = genrule {
    name = "statslog-tvsettings-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module tv_settings" +
        " --javaPackage com.android.tv.twopanelsettings.slices --javaClass TvSettingsStatsLog";
    out = ["com/android/tv/twopanelsettings/slices/TvSettingsStatsLog.java"];
};

#  This is needed to provide TvSettingsStatsLog as a library for TwoPanelSettingsOverlay makefile.
statslog-tvsettings = java_library {
    name = "statslog-tvsettings";
    srcs = [
        ":statslog-tvsettings-java-gen"
    ];
};

TwoPanelSettingsLib = android_library {

    name = "TwoPanelSettingsLib";
    defaults = ["SettingsLibDefaults"];

    srcs = [
        "src/com/android/tv/twopanelsettings/IconUtil.java"
        "src/com/android/tv/twopanelsettings/SettingsPreferenceFragmentBase.java"
        "src/com/android/tv/twopanelsettings/TwoPanelListPreferenceDialogFragment.java"
        "src/com/android/tv/twopanelsettings/TwoPanelScrollView.java"
        "src/com/android/tv/twopanelsettings/TwoPanelSettingsFragment.java"
        "src/com/android/tv/twopanelsettings/TwoPanelSettingsRootView.java"
        "src/com/android/tv/twopanelsettings/slices/ContextSingleton.java"
        "src/com/android/tv/twopanelsettings/slices/EmbeddedSlicePreference.java"
        "src/com/android/tv/twopanelsettings/slices/EmbeddedSlicePreferenceHelper.java"
        "src/com/android/tv/twopanelsettings/slices/EmbeddedSliceSwitchPreference.java"
        "src/com/android/tv/twopanelsettings/slices/HasSliceAction.java"
        "src/com/android/tv/twopanelsettings/slices/HasSliceUri.java"
        "src/com/android/tv/twopanelsettings/slices/InfoFragment.java"
        "src/com/android/tv/twopanelsettings/slices/InfoPreference.java"
        "src/com/android/tv/twopanelsettings/slices/InstrumentationUtils.java"
        "src/com/android/tv/twopanelsettings/slices/PreferenceSliceLiveData.java"
        "src/com/android/tv/twopanelsettings/slices/RadioPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SettingsPreferenceFragment.java"
        "src/com/android/tv/twopanelsettings/slices/SliceCheckboxPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SliceFragment.java"
        "src/com/android/tv/twopanelsettings/slices/SlicePreference.java"
        "src/com/android/tv/twopanelsettings/slices/SlicePreferencesUtil.java"
        "src/com/android/tv/twopanelsettings/slices/SliceRadioPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SliceSwitchPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SlicesConstants.java"
        "src/com/android/tv/twopanelsettings/slices/builders/PreferenceSliceBuilder.java"
        "src/com/android/tv/twopanelsettings/slices/builders/PreferenceSliceBuilderImpl.java"
        "src/com/android/tv/twopanelsettings/slices/builders/TemplateBuilderImpl.java"
        "src/com/android/tv/twopanelsettings/slices/builders/TemplateSliceBuilder.java"
        "src/com/android/tv/twopanelsettings/IconUtil.java"
        "src/com/android/tv/twopanelsettings/SettingsPreferenceFragmentBase.java"
        "src/com/android/tv/twopanelsettings/TwoPanelListPreferenceDialogFragment.java"
        "src/com/android/tv/twopanelsettings/TwoPanelScrollView.java"
        "src/com/android/tv/twopanelsettings/TwoPanelSettingsFragment.java"
        "src/com/android/tv/twopanelsettings/TwoPanelSettingsRootView.java"
        "src/com/android/tv/twopanelsettings/slices/ContextSingleton.java"
        "src/com/android/tv/twopanelsettings/slices/EmbeddedSlicePreference.java"
        "src/com/android/tv/twopanelsettings/slices/EmbeddedSlicePreferenceHelper.java"
        "src/com/android/tv/twopanelsettings/slices/EmbeddedSliceSwitchPreference.java"
        "src/com/android/tv/twopanelsettings/slices/HasSliceAction.java"
        "src/com/android/tv/twopanelsettings/slices/HasSliceUri.java"
        "src/com/android/tv/twopanelsettings/slices/InfoFragment.java"
        "src/com/android/tv/twopanelsettings/slices/InfoPreference.java"
        "src/com/android/tv/twopanelsettings/slices/InstrumentationUtils.java"
        "src/com/android/tv/twopanelsettings/slices/PreferenceSliceLiveData.java"
        "src/com/android/tv/twopanelsettings/slices/RadioPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SettingsPreferenceFragment.java"
        "src/com/android/tv/twopanelsettings/slices/SliceCheckboxPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SliceFragment.java"
        "src/com/android/tv/twopanelsettings/slices/SlicePreference.java"
        "src/com/android/tv/twopanelsettings/slices/SlicePreferencesUtil.java"
        "src/com/android/tv/twopanelsettings/slices/SliceRadioPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SliceSwitchPreference.java"
        "src/com/android/tv/twopanelsettings/slices/SlicesConstants.java"
        "src/com/android/tv/twopanelsettings/slices/builders/PreferenceSliceBuilder.java"
        "src/com/android/tv/twopanelsettings/slices/builders/PreferenceSliceBuilderImpl.java"
        "src/com/android/tv/twopanelsettings/slices/builders/TemplateBuilderImpl.java"
        "src/com/android/tv/twopanelsettings/slices/builders/TemplateSliceBuilder.java"
    ];

    resource_dirs = ["res"];

    static_libs = [
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-preference-v14"
        "androidx.leanback_leanback-preference"
        "androidx.leanback_leanback"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.slice_slice-builders"
        "androidx.slice_slice-core"
        "androidx.slice_slice-view"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.lifecycle_lifecycle-common-java8"
        "androidx.cardview_cardview"
        "statslog-tvsettings"
    ];

    min_sdk_version = "21";
};

#  For the test package.

in { inherit TwoPanelSettingsLib statslog-tvsettings statslog-tvsettings-java-gen; }

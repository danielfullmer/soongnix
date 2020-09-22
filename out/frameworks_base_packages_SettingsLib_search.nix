{ android_library, java_defaults, java_plugin }:
let

SettingsLib-search = android_library {
    name = "SettingsLib-search";
    srcs = [
        "src/com/android/settingslib/search/Indexable.java"
        "src/com/android/settingslib/search/SearchIndexable.java"
        "src/com/android/settingslib/search/SearchIndexableData.java"
        "src/com/android/settingslib/search/SearchIndexableRaw.java"
        "src/com/android/settingslib/search/SearchIndexableResources.java"
    ];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

SettingsLib-annotation-processor = java_plugin {
    name = "SettingsLib-annotation-processor";
    processor_class = "com.android.settingslib.search.IndexableProcessor";
    static_libs = [
        "javapoet-prebuilt-jar"
    ];
    srcs = [
        "processor-src/com/android/settingslib/search/IndexableProcessor.java"
        "src/com/android/settingslib/search/SearchIndexable.java"
    ];
    java_resource_dirs = ["resources"];
};

#  NOTE: Keep this module in sync with ./common.mk
SettingsLib-search-defaults = java_defaults {
    name = "SettingsLib-search-defaults";
    plugins = ["SettingsLib-annotation-processor"];
    static_libs = ["SettingsLib-search"];
};

in { inherit SettingsLib-annotation-processor SettingsLib-search SettingsLib-search-defaults; }

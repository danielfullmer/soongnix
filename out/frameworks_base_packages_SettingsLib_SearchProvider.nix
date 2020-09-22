{ android_library }:
let

SettingsLibSearchProvider = android_library {
    name = "SettingsLibSearchProvider";

    srcs = ["src/com/android/settingslib/searchprovider/SettingsXmlIndexProvider.java"];

    sdk_version = "system_current";
    min_sdk_version = "21";
};

in { inherit SettingsLibSearchProvider; }

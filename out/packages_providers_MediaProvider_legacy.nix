{ android_app }:
let

MediaProviderLegacy = android_app {
    name = "MediaProviderLegacy";
    manifest = "AndroidManifest.xml";

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "guava"
    ];

    libs = ["app-compat-annotations"];

    srcs = [

        "src/com/android/providers/media/LegacyMediaProvider.java"
        ":mediaprovider-database-sources"
    ];

    certificate = "media";
    privileged = true;
    sdk_version = "system_current";
};

in { inherit MediaProviderLegacy; }

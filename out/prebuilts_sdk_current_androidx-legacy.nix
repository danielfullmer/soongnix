{ android_library }:
let

#  All of the following libraries should be replaced with direct usages of the dependencies.
#  BURN THESE WITH FIRE 🔥🔥🔥

"androidx.legacy_legacy-support-v4" = android_library {
    name = "androidx.legacy_legacy-support-v4";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.legacy_legacy-support-v4/AndroidManifest.xml";
    static_libs = [
        "androidx.core_core"
        "androidx.media_media"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.fragment_fragment"
    ];
    java_version = "1.7";
};

"androidx.legacy_legacy-preference-v14" = android_library {
    name = "androidx.legacy_legacy-preference-v14";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml";
    static_libs = [
        "androidx.preference_preference"
    ];
    java_version = "1.7";
};

in { inherit "androidx.legacy_legacy-preference-v14" "androidx.legacy_legacy-support-v4"; }

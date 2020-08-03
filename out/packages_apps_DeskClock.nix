{ android_app }:
let

DeskClock = android_app {
    name = "DeskClock";
    resource_dirs = ["res"];
    sdk_version = "current";
    overrides = ["AlarmClock"];
    srcs = [
        "src/**/*.java"
        "gen/**/*.java"
    ];
    product_specific = true;
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.arch.core_core-common"
        "androidx.lifecycle_lifecycle-common"
        "com.google.android.material_material"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.percentlayout_percentlayout"
        "androidx.transition_transition"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.media_media"
        "androidx.legacy_legacy-support-v13"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.gridlayout_gridlayout"
        "androidx.recyclerview_recyclerview"
    ];
};

in { inherit DeskClock; }

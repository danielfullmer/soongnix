{ android_library, android_library_import }:
let

#  All of the following libraries should be replaced with direct usages of the dependencies.
#  BURN THESE WITH FIRE 🔥🔥🔥

"androidx.legacy_legacy-support-v4" = android_library {
    name = "androidx.legacy_legacy-support-v4";
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
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
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    manifest = "manifests/androidx.legacy_legacy-preference-v14/AndroidManifest.xml";
    static_libs = [
        "androidx.preference_preference"
    ];
    java_version = "1.7";
};

"androidx.legacy_legacy-support-v13-nodeps" = android_library_import {
    name = "androidx.legacy_legacy-support-v13-nodeps";
    aars = ["m2repository/androidx/legacy/legacy-support-v13/1.1.0-alpha01/legacy-support-v13-1.1.0-alpha01.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    static_libs = [
        "androidx.core_core"
        "androidx.fragment_fragment"
        "androidx.viewpager_viewpager"
    ];
};

"androidx.legacy_legacy-support-v13" = android_library {
    name = "androidx.legacy_legacy-support-v13";
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    manifest = "manifests/androidx.legacy_legacy-support-v13/AndroidManifest.xml";
    static_libs = [
        "androidx.legacy_legacy-support-v13-nodeps"
        "androidx.core_core"
        "androidx.fragment_fragment"
        "androidx.viewpager_viewpager"
    ];
    java_version = "1.7";
};

"androidx.legacy_legacy-support-core-ui-nodeps" = android_library_import {
    name = "androidx.legacy_legacy-support-core-ui-nodeps";
    aars = ["m2repository/androidx/legacy/legacy-support-core-ui/1.1.0-alpha01/legacy-support-core-ui-1.1.0-alpha01.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.customview_customview"
        "androidx.viewpager_viewpager"
        "androidx.coordinatorlayout_coordinatorlayout"
        "androidx.drawerlayout_drawerlayout"
        "androidx.slidingpanelayout_slidingpanelayout"
        "androidx.interpolator_interpolator"
        "androidx.swiperefreshlayout_swiperefreshlayout"
        "androidx.asynclayoutinflater_asynclayoutinflater"
        "androidx.cursoradapter_cursoradapter"
    ];
};

"androidx.legacy_legacy-support-core-ui" = android_library {
    name = "androidx.legacy_legacy-support-core-ui";
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    manifest = "manifests/androidx.legacy_legacy-support-core-ui/AndroidManifest.xml";
    static_libs = [
        "androidx.legacy_legacy-support-core-ui-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.customview_customview"
        "androidx.viewpager_viewpager"
        "androidx.coordinatorlayout_coordinatorlayout"
        "androidx.drawerlayout_drawerlayout"
        "androidx.slidingpanelayout_slidingpanelayout"
        "androidx.interpolator_interpolator"
        "androidx.swiperefreshlayout_swiperefreshlayout"
        "androidx.asynclayoutinflater_asynclayoutinflater"
        "androidx.cursoradapter_cursoradapter"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-extensions-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-extensions-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-extensions/2.3.0-alpha01/lifecycle-extensions-2.3.0-alpha01.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    static_libs = [
        "androidx.arch.core_core-common"
        "androidx.lifecycle_lifecycle-common"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.arch.core_core-runtime"
        "androidx.fragment_fragment"
        "androidx.lifecycle_lifecycle-livedata"
        "androidx.lifecycle_lifecycle-process"
        "androidx.lifecycle_lifecycle-service"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
};

"androidx.lifecycle_lifecycle-extensions" = android_library {
    name = "androidx.lifecycle_lifecycle-extensions";
    sdk_version = "current";
    min_sdk_version = "14";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    manifest = "manifests/androidx.lifecycle_lifecycle-extensions/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-extensions-nodeps"
        "androidx.arch.core_core-common"
        "androidx.lifecycle_lifecycle-common"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.arch.core_core-runtime"
        "androidx.fragment_fragment"
        "androidx.lifecycle_lifecycle-livedata"
        "androidx.lifecycle_lifecycle-process"
        "androidx.lifecycle_lifecycle-service"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

"androidx.car_car-nodeps" = android_library_import {
    name = "androidx.car_car-nodeps";
    aars = ["m2repository/androidx/car/car/1.0.0-alpha8/car-1.0.0-alpha8.aar"];
    sdk_version = "current";
    min_sdk_version = "21";
    static_libs = [
        "androidx.annotation_annotation"
        "com.google.android.material_material"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
        "androidx.gridlayout_gridlayout"
        "androidx.preference_preference"
        "androidx-constraintlayout_constraintlayout"
    ];
};

"androidx.car_car" = android_library {
    name = "androidx.car_car";
    sdk_version = "current";
    min_sdk_version = "21";
    manifest = "manifests/androidx.car_car/AndroidManifest.xml";
    static_libs = [
        "androidx.car_car-nodeps"
        "androidx.annotation_annotation"
        "com.google.android.material_material"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
        "androidx.gridlayout_gridlayout"
        "androidx.preference_preference"
        "androidx-constraintlayout_constraintlayout"
    ];
    java_version = "1.7";
};

in { inherit "androidx.car_car" "androidx.car_car-nodeps" "androidx.legacy_legacy-preference-v14" "androidx.legacy_legacy-support-core-ui" "androidx.legacy_legacy-support-core-ui-nodeps" "androidx.legacy_legacy-support-v13" "androidx.legacy_legacy-support-v13-nodeps" "androidx.legacy_legacy-support-v4" "androidx.lifecycle_lifecycle-extensions" "androidx.lifecycle_lifecycle-extensions-nodeps"; }

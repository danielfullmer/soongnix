{ android_library, android_library_import, java_import, java_import_host, java_library_host, java_library_static }:
let

#  Automatically generated with:
#  pom2bp -sdk-version current -static-deps '-rewrite=^android.arch.core:common$=android-arch-core-common' '-rewrite=^android.arch.core:runtime$=android-arch-core-runtime' '-rewrite=^android.arch.lifecycle:common$=android-arch-lifecycle-common' '-rewrite=^android.arch.lifecycle:common-java8$=android-arch-lifecycle-common-java8' '-rewrite=^android.arch.lifecycle:extensions$=android-arch-lifecycle-extensions' '-rewrite=^android.arch.lifecycle:livedata$=android-arch-lifecycle-livedata' '-rewrite=^android.arch.lifecycle:livedata-core$=android-arch-lifecycle-livedata-core' '-rewrite=^android.arch.lifecycle:process$=android-arch-lifecycle-process' '-rewrite=^android.arch.lifecycle:runtime$=android-arch-lifecycle-runtime' '-rewrite=^android.arch.lifecycle:service$=android-arch-lifecycle-service' '-rewrite=^android.arch.lifecycle:viewmodel$=android-arch-lifecycle-viewmodel' '-rewrite=^android.arch.paging:common$=android-arch-paging-common' '-rewrite=^android.arch.paging:runtime$=android-arch-paging-runtime' '-rewrite=^android.arch.persistence.room:common$=android-arch-room-common' '-rewrite=^android.arch.persistence.room:migration$=android-arch-room-migration' '-rewrite=^android.arch.persistence.room:runtime$=android-arch-room-runtime' '-rewrite=^android.arch.persistence.room:testing$=android-arch-room-testing' '-rewrite=^android.arch.persistence:db$=android-arch-persistence-db' '-rewrite=^android.arch.persistence:db-framework$=android-arch-persistence-db-framework' '-rewrite=^androidx.activity:activity$=androidx.activity_activity' '-rewrite=^androidx.activity:activity-ktx$=androidx.activity_activity-ktx' '-rewrite=^androidx.annotation:annotation$=androidx.annotation_annotation' '-rewrite=^androidx.appcompat:appcompat$=androidx.appcompat_appcompat' '-rewrite=^androidx.appcompat:appcompat-resources$=androidx.appcompat_appcompat-resources' '-rewrite=^androidx.arch.core:core-common$=androidx.arch.core_core-common' '-rewrite=^androidx.arch.core:core-runtime$=androidx.arch.core_core-runtime' '-rewrite=^androidx.asynclayoutinflater:asynclayoutinflater$=androidx.asynclayoutinflater_asynclayoutinflater' '-rewrite=^androidx.autofill:autofill$=androidx.autofill_autofill' '-rewrite=^androidx.biometric:biometric$=androidx.biometric_biometric' '-rewrite=^androidx.browser:browser$=androidx.browser_browser' '-rewrite=^androidx.car:car$=androidx.car_car' '-rewrite=^androidx.car:car-cluster$=androidx.car_car-cluster' '-rewrite=^androidx.cardview:cardview$=androidx.cardview_cardview' '-rewrite=^androidx.collection:collection$=androidx.collection_collection' '-rewrite=^androidx.collection:collection-ktx$=androidx.collection_collection-ktx' '-rewrite=^androidx.concurrent:concurrent-futures$=androidx.concurrent_concurrent-futures' '-rewrite=^androidx.concurrent:concurrent-listenablefuture$=androidx.concurrent_concurrent-listenablefuture' '-rewrite=^androidx.concurrent:concurrent-listenablefuture-callback$=androidx.concurrent_concurrent-listenablefuture-callback' '-rewrite=^androidx.constraintlayout:constraintlayout$=androidx-constraintlayout_constraintlayout' '-rewrite=^androidx.constraintlayout:constraintlayout-solver$=androidx-constraintlayout_constraintlayout-solver' '-rewrite=^androidx.contentpaging:contentpaging$=androidx.contentpaging_contentpaging' '-rewrite=^androidx.coordinatorlayout:coordinatorlayout$=androidx.coordinatorlayout_coordinatorlayout' '-rewrite=^androidx.core:core$=androidx.core_core' '-rewrite=^androidx.core:core-animation$=androidx.core_core-animation' '-rewrite=^androidx.core:core-ktx$=androidx.core_core-ktx' '-rewrite=^androidx.cursoradapter:cursoradapter$=androidx.cursoradapter_cursoradapter' '-rewrite=^androidx.customview:customview$=androidx.customview_customview' '-rewrite=^androidx.documentfile:documentfile$=androidx.documentfile_documentfile' '-rewrite=^androidx.drawerlayout:drawerlayout$=androidx.drawerlayout_drawerlayout' '-rewrite=^androidx.dynamicanimation:dynamicanimation$=androidx.dynamicanimation_dynamicanimation' '-rewrite=^androidx.emoji:emoji$=androidx.emoji_emoji' '-rewrite=^androidx.emoji:emoji-appcompat$=androidx.emoji_emoji-appcompat' '-rewrite=^androidx.emoji:emoji-bundled$=androidx.emoji_emoji-bundled' '-rewrite=^androidx.exifinterface:exifinterface$=androidx.exifinterface_exifinterface' '-rewrite=^androidx.fragment:fragment$=androidx.fragment_fragment' '-rewrite=^androidx.fragment:fragment-ktx$=androidx.fragment_fragment-ktx' '-rewrite=^androidx.gridlayout:gridlayout$=androidx.gridlayout_gridlayout' '-rewrite=^androidx.heifwriter:heifwriter$=androidx.heifwriter_heifwriter' '-rewrite=^androidx.interpolator:interpolator$=androidx.interpolator_interpolator' '-rewrite=^androidx.leanback:leanback$=androidx.leanback_leanback' '-rewrite=^androidx.leanback:leanback-preference$=androidx.leanback_leanback-preference' '-rewrite=^androidx.legacy:legacy-preference-v14$=androidx.legacy_legacy-preference-v14' '-rewrite=^androidx.legacy:legacy-support-core-ui$=androidx.legacy_legacy-support-core-ui' '-rewrite=^androidx.legacy:legacy-support-core-utils$=androidx.legacy_legacy-support-core-utils' '-rewrite=^androidx.legacy:legacy-support-v13$=androidx.legacy_legacy-support-v13' '-rewrite=^androidx.legacy:legacy-support-v4$=androidx.legacy_legacy-support-v4' '-rewrite=^androidx.lifecycle:lifecycle-common$=androidx.lifecycle_lifecycle-common' '-rewrite=^androidx.lifecycle:lifecycle-common-java8$=androidx.lifecycle_lifecycle-common-java8' '-rewrite=^androidx.lifecycle:lifecycle-extensions$=androidx.lifecycle_lifecycle-extensions' '-rewrite=^androidx.lifecycle:lifecycle-livedata$=androidx.lifecycle_lifecycle-livedata' '-rewrite=^androidx.lifecycle:lifecycle-livedata-core$=androidx.lifecycle_lifecycle-livedata-core' '-rewrite=^androidx.lifecycle:lifecycle-livedata-core-ktx$=androidx.lifecycle_lifecycle-livedata-core-ktx' '-rewrite=^androidx.lifecycle:lifecycle-livedata-ktx$=androidx.lifecycle_lifecycle-livedata-ktx' '-rewrite=^androidx.lifecycle:lifecycle-process$=androidx.lifecycle_lifecycle-process' '-rewrite=^androidx.lifecycle:lifecycle-runtime$=androidx.lifecycle_lifecycle-runtime' '-rewrite=^androidx.lifecycle:lifecycle-runtime-ktx$=androidx.lifecycle_lifecycle-runtime-ktx' '-rewrite=^androidx.lifecycle:lifecycle-service$=androidx.lifecycle_lifecycle-service' '-rewrite=^androidx.lifecycle:lifecycle-viewmodel$=androidx.lifecycle_lifecycle-viewmodel' '-rewrite=^androidx.lifecycle:lifecycle-viewmodel-ktx$=androidx.lifecycle_lifecycle-viewmodel-ktx' '-rewrite=^androidx.lifecycle:lifecycle-viewmodel-savedstate$=androidx.lifecycle_lifecycle-viewmodel-savedstate' '-rewrite=^androidx.loader:loader$=androidx.loader_loader' '-rewrite=^androidx.localbroadcastmanager:localbroadcastmanager$=androidx.localbroadcastmanager_localbroadcastmanager' '-rewrite=^androidx.media2:media2-common$=androidx.media2_media2-common' '-rewrite=^androidx.media2:media2-exoplayer$=androidx.media2_media2-exoplayer' '-rewrite=^androidx.media2:media2-player$=androidx.media2_media2-player' '-rewrite=^androidx.media2:media2-session$=androidx.media2_media2-session' '-rewrite=^androidx.media2:media2-widget$=androidx.media2_media2-widget' '-rewrite=^androidx.media:media$=androidx.media_media' '-rewrite=^androidx.mediarouter:mediarouter$=androidx.mediarouter_mediarouter' '-rewrite=^androidx.multidex:multidex$=androidx-multidex_multidex' '-rewrite=^androidx.multidex:multidex-instrumentation$=androidx-multidex_multidex-instrumentation' '-rewrite=^androidx.navigation:navigation-common$=androidx.navigation_navigation-common' '-rewrite=^androidx.navigation:navigation-common-ktx$=androidx.navigation_navigation-common-ktx' '-rewrite=^androidx.navigation:navigation-fragment$=androidx.navigation_navigation-fragment' '-rewrite=^androidx.navigation:navigation-fragment-ktx$=androidx.navigation_navigation-fragment-ktx' '-rewrite=^androidx.navigation:navigation-runtime$=androidx.navigation_navigation-runtime' '-rewrite=^androidx.navigation:navigation-runtime-ktx$=androidx.navigation_navigation-runtime-ktx' '-rewrite=^androidx.navigation:navigation-ui$=androidx.navigation_navigation-ui' '-rewrite=^androidx.navigation:navigation-ui-ktx$=androidx.navigation_navigation-ui-ktx' '-rewrite=^androidx.paging:paging-common$=androidx.paging_paging-common' '-rewrite=^androidx.paging:paging-common-ktx$=androidx.paging_paging-common-ktx' '-rewrite=^androidx.paging:paging-runtime$=androidx.paging_paging-runtime' '-rewrite=^androidx.palette:palette$=androidx.palette_palette' '-rewrite=^androidx.percentlayout:percentlayout$=androidx.percentlayout_percentlayout' '-rewrite=^androidx.preference:preference$=androidx.preference_preference' '-rewrite=^androidx.print:print$=androidx.print_print' '-rewrite=^androidx.recommendation:recommendation$=androidx.recommendation_recommendation' '-rewrite=^androidx.recyclerview:recyclerview$=androidx.recyclerview_recyclerview' '-rewrite=^androidx.recyclerview:recyclerview-selection$=androidx.recyclerview_recyclerview-selection' '-rewrite=^androidx.remotecallback:remotecallback$=androidx.remotecallback_remotecallback' '-rewrite=^androidx.remotecallback:remotecallback-processor$=androidx.remotecallback_remotecallback-processor' '-rewrite=^androidx.room:room-common$=androidx.room_room-common' '-rewrite=^androidx.room:room-compiler$=androidx.room_room-compiler' '-rewrite=^androidx.room:room-migration$=androidx.room_room-migration' '-rewrite=^androidx.room:room-runtime$=androidx.room_room-runtime' '-rewrite=^androidx.room:room-testing$=androidx.room_room-testing' '-rewrite=^androidx.savedstate:savedstate$=androidx.savedstate_savedstate' '-rewrite=^androidx.slice:slice-builders$=androidx.slice_slice-builders' '-rewrite=^androidx.slice:slice-core$=androidx.slice_slice-core' '-rewrite=^androidx.slice:slice-view$=androidx.slice_slice-view' '-rewrite=^androidx.slidingpanelayout:slidingpanelayout$=androidx.slidingpanelayout_slidingpanelayout' '-rewrite=^androidx.sqlite:sqlite$=androidx.sqlite_sqlite' '-rewrite=^androidx.sqlite:sqlite-framework$=androidx.sqlite_sqlite-framework' '-rewrite=^androidx.swiperefreshlayout:swiperefreshlayout$=androidx.swiperefreshlayout_swiperefreshlayout' '-rewrite=^androidx.textclassifier:textclassifier$=androidx.textclassifier_textclassifier' '-rewrite=^androidx.transition:transition$=androidx.transition_transition' '-rewrite=^androidx.tvprovider:tvprovider$=androidx.tvprovider_tvprovider' '-rewrite=^androidx.vectordrawable:vectordrawable$=androidx.vectordrawable_vectordrawable' '-rewrite=^androidx.vectordrawable:vectordrawable-animated$=androidx.vectordrawable_vectordrawable-animated' '-rewrite=^androidx.versionedparcelable:versionedparcelable$=androidx.versionedparcelable_versionedparcelable' '-rewrite=^androidx.viewpager2:viewpager2$=androidx.viewpager2_viewpager2' '-rewrite=^androidx.viewpager:viewpager$=androidx.viewpager_viewpager' '-rewrite=^androidx.wear:wear$=androidx.wear_wear' '-rewrite=^androidx.webkit:webkit$=androidx.webkit_webkit' '-rewrite=^com.android.support.constraint:constraint-layout$=android-support-constraint-layout' '-rewrite=^com.android.support.constraint:constraint-layout-solver$=android-support-constraint-layout-solver' '-rewrite=^com.android.support:animated-vector-drawable$=android-support-animatedvectordrawable' '-rewrite=^com.android.support:appcompat-v7$=android-support-v7-appcompat' '-rewrite=^com.android.support:asynclayoutinflater$=android-support-asynclayoutinflater' '-rewrite=^com.android.support:car$=android-support-car' '-rewrite=^com.android.support:cardview-v7$=android-support-v7-cardview' '-rewrite=^com.android.support:collections$=android-support-collections' '-rewrite=^com.android.support:contentpaging$=android-support-contentpaging' '-rewrite=^com.android.support:coordinatorlayout$=android-support-coordinatorlayout' '-rewrite=^com.android.support:cursoradapter$=android-support-cursoradapter' '-rewrite=^com.android.support:customtabs$=android-support-customtabs' '-rewrite=^com.android.support:customview$=android-support-customview' '-rewrite=^com.android.support:design$=android-support-design' '-rewrite=^com.android.support:design-animation$=android-support-design-animation' '-rewrite=^com.android.support:design-bottomappbar$=android-support-design-bottomappbar' '-rewrite=^com.android.support:design-bottomnavigation$=android-support-design-bottomnavigation' '-rewrite=^com.android.support:design-bottomsheet$=android-support-design-bottomsheet' '-rewrite=^com.android.support:design-button$=android-support-design-button' '-rewrite=^com.android.support:design-canvas$=android-support-design-canvas' '-rewrite=^com.android.support:design-card$=android-support-design-card' '-rewrite=^com.android.support:design-chip$=android-support-design-chip' '-rewrite=^com.android.support:design-circularreveal$=android-support-design-circularreveal' '-rewrite=^com.android.support:design-circularreveal-cardview$=android-support-design-circularreveal-cardview' '-rewrite=^com.android.support:design-circularreveal-coordinatorlayout$=android-support-design-circularreveal-coordinatorlayout' '-rewrite=^com.android.support:design-color$=android-support-design-color' '-rewrite=^com.android.support:design-dialog$=android-support-design-dialog' '-rewrite=^com.android.support:design-drawable$=android-support-design-drawable' '-rewrite=^com.android.support:design-expandable$=android-support-design-expandable' '-rewrite=^com.android.support:design-floatingactionbutton$=android-support-design-floatingactionbutton' '-rewrite=^com.android.support:design-internal$=android-support-design-internal' '-rewrite=^com.android.support:design-math$=android-support-design-math' '-rewrite=^com.android.support:design-navigation$=android-support-design-navigation' '-rewrite=^com.android.support:design-resources$=android-support-design-resources' '-rewrite=^com.android.support:design-ripple$=android-support-design-ripple' '-rewrite=^com.android.support:design-shape$=android-support-design-shape' '-rewrite=^com.android.support:design-snackbar$=android-support-design-snackbar' '-rewrite=^com.android.support:design-stateful$=android-support-design-stateful' '-rewrite=^com.android.support:design-tabs$=android-support-design-tabs' '-rewrite=^com.android.support:design-textfield$=android-support-design-textfield' '-rewrite=^com.android.support:design-theme$=android-support-design-theme' '-rewrite=^com.android.support:design-transformation$=android-support-design-transformation' '-rewrite=^com.android.support:design-typography$=android-support-design-typography' '-rewrite=^com.android.support:design-widget$=android-support-design-widget' '-rewrite=^com.android.support:documentfile$=android-support-documentfile' '-rewrite=^com.android.support:drawerlayout$=android-support-drawerlayout' '-rewrite=^com.android.support:exifinterface$=android-support-exifinterface' '-rewrite=^com.android.support:gridlayout-v7$=android-support-v7-gridlayout' '-rewrite=^com.android.support:heifwriter$=android-support-heifwriter' '-rewrite=^com.android.support:interpolator$=android-support-interpolator' '-rewrite=^com.android.support:leanback-v17$=android-support-v17-leanback' '-rewrite=^com.android.support:loader$=android-support-loader' '-rewrite=^com.android.support:localbroadcastmanager$=android-support-localbroadcastmanager' '-rewrite=^com.android.support:mediarouter-v7$=android-support-v7-mediarouter' '-rewrite=^com.android.support:multidex$=android-support-multidex' '-rewrite=^com.android.support:multidex-instrumentation$=android-support-multidex-instrumentation' '-rewrite=^com.android.support:palette-v7$=android-support-v7-palette' '-rewrite=^com.android.support:percent$=android-support-percent' '-rewrite=^com.android.support:preference-leanback-v17$=android-support-v17-preference-leanback' '-rewrite=^com.android.support:preference-v14$=android-support-v14-preference' '-rewrite=^com.android.support:preference-v7$=android-support-v7-preference' '-rewrite=^com.android.support:print$=android-support-print' '-rewrite=^com.android.support:recommendation$=android-support-recommendation' '-rewrite=^com.android.support:recyclerview-selection$=android-support-recyclerview-selection' '-rewrite=^com.android.support:recyclerview-v7$=android-support-v7-recyclerview' '-rewrite=^com.android.support:slices-builders$=android-slices-builders' '-rewrite=^com.android.support:slices-core$=android-slices-core' '-rewrite=^com.android.support:slices-view$=android-slices-view' '-rewrite=^com.android.support:slidingpanelayout$=android-support-slidingpanelayout' '-rewrite=^com.android.support:support-annotations$=android-support-annotations' '-rewrite=^com.android.support:support-compat$=android-support-compat' '-rewrite=^com.android.support:support-content$=android-support-support-content' '-rewrite=^com.android.support:support-core-ui$=android-support-core-ui' '-rewrite=^com.android.support:support-core-utils$=android-support-core-utils' '-rewrite=^com.android.support:support-dynamic-animation$=android-support-dynamic-animation' '-rewrite=^com.android.support:support-emoji$=android-support-emoji' '-rewrite=^com.android.support:support-emoji-appcompat$=android-support-emoji-appcompat' '-rewrite=^com.android.support:support-emoji-bundled$=android-support-emoji-bundled' '-rewrite=^com.android.support:support-fragment$=android-support-fragment' '-rewrite=^com.android.support:support-media-compat$=android-support-media-compat' '-rewrite=^com.android.support:support-tv-provider$=android-support-tv-provider' '-rewrite=^com.android.support:support-v13$=android-support-v13' '-rewrite=^com.android.support:support-v4$=android-support-v4' '-rewrite=^com.android.support:support-vector-drawable$=android-support-vectordrawable' '-rewrite=^com.android.support:swiperefreshlayout$=android-support-swiperefreshlayout' '-rewrite=^com.android.support:textclassifier$=android-support-textclassifier' '-rewrite=^com.android.support:transition$=android-support-transition' '-rewrite=^com.android.support:versionedparcelable$=android-versionedparcelable' '-rewrite=^com.android.support:viewpager$=android-support-viewpager' '-rewrite=^com.android.support:wear$=android-support-wear' '-rewrite=^com.android.support:webkit$=android-support-webkit' '-rewrite=^com.google.android.material:material$=com.google.android.material_material' '-rewrite=^com.google.android:flexbox$=flexbox' '-rewrite=^com.squareup:javapoet$=javapoet-prebuilt-jar' '-rewrite=^com.google.guava:listenablefuture$=guava-listenablefuture-prebuilt-jar' '-rewrite=^sqlite-jdbc$=xerial-sqlite-jdbc' '-rewrite=^gson$=gson-prebuilt-jar' '-rewrite=^com.intellij:annotations$=jetbrains-annotations' -extra-static-libs=android-support-car=prebuilt-android.car-stubs -extra-static-libs=androidx.room_room-compiler=guava-21.0 '-host=androidx.remotecallback:remotecallback-processor' '-host=androidx.room:room-compiler' '-host-and-device=androidx.annotation:annotation' '-host-and-device=androidx.room:room-common' '-host-and-device=androidx.room:room-migration' -exclude=android-arch-room-migration -exclude=android-arch-room-testing .

"androidx.activity_activity-ktx-nodeps" = android_library_import {
    name = "androidx.activity_activity-ktx-nodeps";
    aars = ["m2repository/androidx/activity/activity-ktx/1.2.0-alpha07/activity-ktx-1.2.0-alpha07.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.activity_activity"
        "androidx.core_core-ktx"
        "androidx.lifecycle_lifecycle-runtime-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
};

"androidx.activity_activity-ktx" = android_library {
    name = "androidx.activity_activity-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.activity_activity-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.activity_activity-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.activity_activity"
        "androidx.core_core-ktx"
        "androidx.lifecycle_lifecycle-runtime-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
    java_version = "1.7";
};

"androidx.activity_activity-nodeps" = android_library_import {
    name = "androidx.activity_activity-nodeps";
    aars = ["m2repository/androidx/activity/activity/1.2.0-alpha07/activity-1.2.0-alpha07.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-viewmodel-savedstate"
    ];
};

"androidx.activity_activity" = android_library {
    name = "androidx.activity_activity";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.activity_activity/AndroidManifest.xml";
    static_libs = [
        "androidx.activity_activity-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-viewmodel-savedstate"
    ];
    java_version = "1.7";
};

"androidx.annotation_annotation-nodeps" = java_import {
    name = "androidx.annotation_annotation-nodeps";
    jars = ["m2repository/androidx/annotation/annotation/1.2.0-alpha02/annotation-1.2.0-alpha02.jar"];
    sdk_version = "current";
    host_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.annotation_annotation" = java_library_static {
    name = "androidx.annotation_annotation";
    sdk_version = "current";
    host_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.annotation_annotation-nodeps"
    ];
    java_version = "1.7";
};

"androidx.appcompat_appcompat-resources-nodeps" = android_library_import {
    name = "androidx.appcompat_appcompat-resources-nodeps";
    aars = ["m2repository/androidx/appcompat/appcompat-resources/1.3.0-alpha01/appcompat-resources-1.3.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.vectordrawable_vectordrawable"
        "androidx.vectordrawable_vectordrawable-animated"
    ];
};

"androidx.appcompat_appcompat-resources" = android_library {
    name = "androidx.appcompat_appcompat-resources";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.appcompat_appcompat-resources/AndroidManifest.xml";
    static_libs = [
        "androidx.appcompat_appcompat-resources-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.vectordrawable_vectordrawable"
        "androidx.vectordrawable_vectordrawable-animated"
    ];
    java_version = "1.7";
};

"androidx.appcompat_appcompat-nodeps" = android_library_import {
    name = "androidx.appcompat_appcompat-nodeps";
    aars = ["m2repository/androidx/appcompat/appcompat/1.3.0-alpha01/appcompat-1.3.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.cursoradapter_cursoradapter"
        "androidx.fragment_fragment"
        "androidx.appcompat_appcompat-resources"
        "androidx.drawerlayout_drawerlayout"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
};

"androidx.appcompat_appcompat" = android_library {
    name = "androidx.appcompat_appcompat";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.appcompat_appcompat/AndroidManifest.xml";
    static_libs = [
        "androidx.appcompat_appcompat-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.cursoradapter_cursoradapter"
        "androidx.fragment_fragment"
        "androidx.appcompat_appcompat-resources"
        "androidx.drawerlayout_drawerlayout"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

"androidx.arch.core_core-common-nodeps" = java_import {
    name = "androidx.arch.core_core-common-nodeps";
    jars = ["m2repository/androidx/arch/core/core-common/2.2.0-alpha01/core-common-2.2.0-alpha01.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.arch.core_core-common" = java_library_static {
    name = "androidx.arch.core_core-common";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.arch.core_core-common-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.arch.core_core-runtime-nodeps" = android_library_import {
    name = "androidx.arch.core_core-runtime-nodeps";
    aars = ["m2repository/androidx/arch/core/core-runtime/2.2.0-alpha01/core-runtime-2.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.arch.core_core-common"
    ];
};

"androidx.arch.core_core-runtime" = android_library {
    name = "androidx.arch.core_core-runtime";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.arch.core_core-runtime/AndroidManifest.xml";
    static_libs = [
        "androidx.arch.core_core-runtime-nodeps"
        "androidx.annotation_annotation"
        "androidx.arch.core_core-common"
    ];
    java_version = "1.7";
};

"androidx.asynclayoutinflater_asynclayoutinflater-nodeps" = android_library_import {
    name = "androidx.asynclayoutinflater_asynclayoutinflater-nodeps";
    aars = ["m2repository/androidx/asynclayoutinflater/asynclayoutinflater/1.1.0-alpha01/asynclayoutinflater-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.asynclayoutinflater_asynclayoutinflater" = android_library {
    name = "androidx.asynclayoutinflater_asynclayoutinflater";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.asynclayoutinflater_asynclayoutinflater/AndroidManifest.xml";
    static_libs = [
        "androidx.asynclayoutinflater_asynclayoutinflater-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.autofill_autofill-nodeps" = android_library_import {
    name = "androidx.autofill_autofill-nodeps";
    aars = ["m2repository/androidx/autofill/autofill/1.1.0-alpha02/autofill-1.1.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.core_core"
    ];
};

"androidx.autofill_autofill" = android_library {
    name = "androidx.autofill_autofill";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.autofill_autofill/AndroidManifest.xml";
    static_libs = [
        "androidx.autofill_autofill-nodeps"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.biometric_biometric-nodeps" = android_library_import {
    name = "androidx.biometric_biometric-nodeps";
    aars = ["m2repository/androidx/biometric/biometric/1.1.0-alpha01/biometric-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.fragment_fragment"
        "androidx.activity_activity"
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
};

"androidx.biometric_biometric" = android_library {
    name = "androidx.biometric_biometric";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.biometric_biometric/AndroidManifest.xml";
    static_libs = [
        "androidx.biometric_biometric-nodeps"
        "androidx.annotation_annotation"
        "androidx.fragment_fragment"
        "androidx.activity_activity"
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

"androidx.browser_browser-nodeps" = android_library_import {
    name = "androidx.browser_browser-nodeps";
    aars = ["m2repository/androidx/browser/browser/1.3.0-alpha04/browser-1.3.0-alpha04.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    static_libs = [
        "androidx.annotation_annotation"
        "guava-listenablefuture-prebuilt-jar"
        "androidx.collection_collection"
        "androidx.concurrent_concurrent-futures"
        "androidx.core_core"
        "androidx.interpolator_interpolator"
    ];
};

"androidx.browser_browser" = android_library {
    name = "androidx.browser_browser";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    manifest = "manifests/androidx.browser_browser/AndroidManifest.xml";
    static_libs = [
        "androidx.browser_browser-nodeps"
        "androidx.annotation_annotation"
        "guava-listenablefuture-prebuilt-jar"
        "androidx.collection_collection"
        "androidx.concurrent_concurrent-futures"
        "androidx.core_core"
        "androidx.interpolator_interpolator"
    ];
    java_version = "1.7";
};

"androidx.cardview_cardview-nodeps" = android_library_import {
    name = "androidx.cardview_cardview-nodeps";
    aars = ["m2repository/androidx/cardview/cardview/1.1.0-alpha01/cardview-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.cardview_cardview" = android_library {
    name = "androidx.cardview_cardview";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.cardview_cardview/AndroidManifest.xml";
    static_libs = [
        "androidx.cardview_cardview-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.collection_collection-ktx-nodeps" = java_import {
    name = "androidx.collection_collection-ktx-nodeps";
    jars = ["m2repository/androidx/collection/collection-ktx/1.2.0-alpha01/collection-ktx-1.2.0-alpha01.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.collection_collection-ktx" = java_library_static {
    name = "androidx.collection_collection-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.collection_collection-ktx-nodeps"
        "androidx.collection_collection"
        "kotlin-stdlib"
    ];
    java_version = "1.7";
};

"androidx.collection_collection-nodeps" = java_import {
    name = "androidx.collection_collection-nodeps";
    jars = ["m2repository/androidx/collection/collection/1.2.0-alpha01/collection-1.2.0-alpha01.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.collection_collection" = java_library_static {
    name = "androidx.collection_collection";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.collection_collection-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.concurrent_concurrent-futures-nodeps" = java_import {
    name = "androidx.concurrent_concurrent-futures-nodeps";
    jars = ["m2repository/androidx/concurrent/concurrent-futures/1.1.0-beta01/concurrent-futures-1.1.0-beta01.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.concurrent_concurrent-futures" = java_library_static {
    name = "androidx.concurrent_concurrent-futures";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.concurrent_concurrent-futures-nodeps"
        "androidx.annotation_annotation"
        "guava-listenablefuture-prebuilt-jar"
    ];
    java_version = "1.7";
};

"androidx.coordinatorlayout_coordinatorlayout-nodeps" = android_library_import {
    name = "androidx.coordinatorlayout_coordinatorlayout-nodeps";
    aars = ["m2repository/androidx/coordinatorlayout/coordinatorlayout/1.2.0-alpha01/coordinatorlayout-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.customview_customview"
    ];
};

"androidx.coordinatorlayout_coordinatorlayout" = android_library {
    name = "androidx.coordinatorlayout_coordinatorlayout";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.coordinatorlayout_coordinatorlayout/AndroidManifest.xml";
    static_libs = [
        "androidx.coordinatorlayout_coordinatorlayout-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.customview_customview"
    ];
    java_version = "1.7";
};

"androidx.core_core-animation-nodeps" = android_library_import {
    name = "androidx.core_core-animation-nodeps";
    aars = ["m2repository/androidx/core/core-animation/1.0.0-alpha02/core-animation-1.0.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.core_core-animation" = android_library {
    name = "androidx.core_core-animation";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.core_core-animation/AndroidManifest.xml";
    static_libs = [
        "androidx.core_core-animation-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.core_core-ktx-nodeps" = android_library_import {
    name = "androidx.core_core-ktx-nodeps";
    aars = ["m2repository/androidx/core/core-ktx/1.5.0-alpha01/core-ktx-1.5.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.core_core-ktx" = android_library {
    name = "androidx.core_core-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.core_core-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.core_core-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.core_core-nodeps" = android_library_import {
    name = "androidx.core_core-nodeps";
    aars = ["m2repository/androidx/core/core/1.5.0-alpha01/core-1.5.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.versionedparcelable_versionedparcelable"
    ];
};

"androidx.core_core" = android_library {
    name = "androidx.core_core";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.core_core/AndroidManifest.xml";
    static_libs = [
        "androidx.core_core-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.versionedparcelable_versionedparcelable"
    ];
    java_version = "1.7";
};

"androidx.cursoradapter_cursoradapter-nodeps" = android_library_import {
    name = "androidx.cursoradapter_cursoradapter-nodeps";
    aars = ["m2repository/androidx/cursoradapter/cursoradapter/1.1.0-alpha01/cursoradapter-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.cursoradapter_cursoradapter" = android_library {
    name = "androidx.cursoradapter_cursoradapter";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.cursoradapter_cursoradapter/AndroidManifest.xml";
    static_libs = [
        "androidx.cursoradapter_cursoradapter-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.customview_customview-nodeps" = android_library_import {
    name = "androidx.customview_customview-nodeps";
    aars = ["m2repository/androidx/customview/customview/1.2.0-alpha01/customview-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.customview_customview" = android_library {
    name = "androidx.customview_customview";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.customview_customview/AndroidManifest.xml";
    static_libs = [
        "androidx.customview_customview-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.documentfile_documentfile-nodeps" = android_library_import {
    name = "androidx.documentfile_documentfile-nodeps";
    aars = ["m2repository/androidx/documentfile/documentfile/1.1.0-alpha01/documentfile-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.documentfile_documentfile" = android_library {
    name = "androidx.documentfile_documentfile";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.documentfile_documentfile/AndroidManifest.xml";
    static_libs = [
        "androidx.documentfile_documentfile-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.drawerlayout_drawerlayout-nodeps" = android_library_import {
    name = "androidx.drawerlayout_drawerlayout-nodeps";
    aars = ["m2repository/androidx/drawerlayout/drawerlayout/1.2.0-alpha01/drawerlayout-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.customview_customview"
    ];
};

"androidx.drawerlayout_drawerlayout" = android_library {
    name = "androidx.drawerlayout_drawerlayout";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.drawerlayout_drawerlayout/AndroidManifest.xml";
    static_libs = [
        "androidx.drawerlayout_drawerlayout-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.customview_customview"
    ];
    java_version = "1.7";
};

"androidx.dynamicanimation_dynamicanimation-nodeps" = android_library_import {
    name = "androidx.dynamicanimation_dynamicanimation-nodeps";
    aars = ["m2repository/androidx/dynamicanimation/dynamicanimation/1.1.0-alpha04/dynamicanimation-1.1.0-alpha04.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.dynamicanimation_dynamicanimation" = android_library {
    name = "androidx.dynamicanimation_dynamicanimation";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.dynamicanimation_dynamicanimation/AndroidManifest.xml";
    static_libs = [
        "androidx.dynamicanimation_dynamicanimation-nodeps"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.emoji_emoji-appcompat-nodeps" = android_library_import {
    name = "androidx.emoji_emoji-appcompat-nodeps";
    aars = ["m2repository/androidx/emoji/emoji-appcompat/1.2.0-alpha01/emoji-appcompat-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.emoji_emoji"
        "androidx.appcompat_appcompat"
    ];
};

"androidx.emoji_emoji-appcompat" = android_library {
    name = "androidx.emoji_emoji-appcompat";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.emoji_emoji-appcompat/AndroidManifest.xml";
    static_libs = [
        "androidx.emoji_emoji-appcompat-nodeps"
        "androidx.emoji_emoji"
        "androidx.appcompat_appcompat"
    ];
    java_version = "1.7";
};

"androidx.emoji_emoji-bundled-nodeps" = android_library_import {
    name = "androidx.emoji_emoji-bundled-nodeps";
    aars = ["m2repository/androidx/emoji/emoji-bundled/1.2.0-alpha01/emoji-bundled-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.emoji_emoji"
    ];
};

"androidx.emoji_emoji-bundled" = android_library {
    name = "androidx.emoji_emoji-bundled";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.emoji_emoji-bundled/AndroidManifest.xml";
    static_libs = [
        "androidx.emoji_emoji-bundled-nodeps"
        "androidx.emoji_emoji"
    ];
    java_version = "1.7";
};

"androidx.emoji_emoji-nodeps" = android_library_import {
    name = "androidx.emoji_emoji-nodeps";
    aars = ["m2repository/androidx/emoji/emoji/1.2.0-alpha01/emoji-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.emoji_emoji" = android_library {
    name = "androidx.emoji_emoji";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.emoji_emoji/AndroidManifest.xml";
    static_libs = [
        "androidx.emoji_emoji-nodeps"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.exifinterface_exifinterface-nodeps" = android_library_import {
    name = "androidx.exifinterface_exifinterface-nodeps";
    aars = ["m2repository/androidx/exifinterface/exifinterface/1.3.0-alpha02/exifinterface-1.3.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.exifinterface_exifinterface" = android_library {
    name = "androidx.exifinterface_exifinterface";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.exifinterface_exifinterface/AndroidManifest.xml";
    static_libs = [
        "androidx.exifinterface_exifinterface-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.fragment_fragment-ktx-nodeps" = android_library_import {
    name = "androidx.fragment_fragment-ktx-nodeps";
    aars = ["m2repository/androidx/fragment/fragment-ktx/1.3.0-alpha07/fragment-ktx-1.3.0-alpha07.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection-ktx"
        "kotlin-stdlib"
        "androidx.fragment_fragment"
        "androidx.activity_activity-ktx"
        "androidx.core_core-ktx"
        "androidx.lifecycle_lifecycle-livedata-core-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
};

"androidx.fragment_fragment-ktx" = android_library {
    name = "androidx.fragment_fragment-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.fragment_fragment-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.fragment_fragment-ktx-nodeps"
        "androidx.collection_collection-ktx"
        "kotlin-stdlib"
        "androidx.fragment_fragment"
        "androidx.activity_activity-ktx"
        "androidx.core_core-ktx"
        "androidx.lifecycle_lifecycle-livedata-core-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
    java_version = "1.7";
};

"androidx.fragment_fragment-nodeps" = android_library_import {
    name = "androidx.fragment_fragment-nodeps";
    aars = ["m2repository/androidx/fragment/fragment/1.3.0-alpha07/fragment-1.3.0-alpha07.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.viewpager_viewpager"
        "androidx.loader_loader"
        "androidx.activity_activity"
        "androidx.lifecycle_lifecycle-livedata-core"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.lifecycle_lifecycle-viewmodel-savedstate"
        "androidx.savedstate_savedstate"
    ];
};

"androidx.fragment_fragment" = android_library {
    name = "androidx.fragment_fragment";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.fragment_fragment/AndroidManifest.xml";
    static_libs = [
        "androidx.fragment_fragment-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.viewpager_viewpager"
        "androidx.loader_loader"
        "androidx.activity_activity"
        "androidx.lifecycle_lifecycle-livedata-core"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.lifecycle_lifecycle-viewmodel-savedstate"
        "androidx.savedstate_savedstate"
    ];
    java_version = "1.7";
};

"androidx.gridlayout_gridlayout-nodeps" = android_library_import {
    name = "androidx.gridlayout_gridlayout-nodeps";
    aars = ["m2repository/androidx/gridlayout/gridlayout/1.1.0-alpha01/gridlayout-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.gridlayout_gridlayout" = android_library {
    name = "androidx.gridlayout_gridlayout";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.gridlayout_gridlayout/AndroidManifest.xml";
    static_libs = [
        "androidx.gridlayout_gridlayout-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.heifwriter_heifwriter-nodeps" = android_library_import {
    name = "androidx.heifwriter_heifwriter-nodeps";
    aars = ["m2repository/androidx/heifwriter/heifwriter/1.1.0-alpha01/heifwriter-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "28";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.heifwriter_heifwriter" = android_library {
    name = "androidx.heifwriter_heifwriter";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "28";
    manifest = "manifests/androidx.heifwriter_heifwriter/AndroidManifest.xml";
    static_libs = [
        "androidx.heifwriter_heifwriter-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.interpolator_interpolator-nodeps" = android_library_import {
    name = "androidx.interpolator_interpolator-nodeps";
    aars = ["m2repository/androidx/interpolator/interpolator/1.1.0-alpha01/interpolator-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.interpolator_interpolator" = android_library {
    name = "androidx.interpolator_interpolator";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.interpolator_interpolator/AndroidManifest.xml";
    static_libs = [
        "androidx.interpolator_interpolator-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.leanback_leanback-preference-nodeps" = android_library_import {
    name = "androidx.leanback_leanback-preference-nodeps";
    aars = ["m2repository/androidx/leanback/leanback-preference/1.1.0-alpha04/leanback-preference-1.1.0-alpha04.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "21";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.leanback_leanback"
    ];
};

"androidx.leanback_leanback-preference" = android_library {
    name = "androidx.leanback_leanback-preference";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "21";
    manifest = "manifests/androidx.leanback_leanback-preference/AndroidManifest.xml";
    static_libs = [
        "androidx.leanback_leanback-preference-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.leanback_leanback"
    ];
    java_version = "1.7";
};

"androidx.leanback_leanback-nodeps" = android_library_import {
    name = "androidx.leanback_leanback-nodeps";
    aars = ["m2repository/androidx/leanback/leanback/1.1.0-alpha04/leanback-1.1.0-alpha04.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "17";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.interpolator_interpolator"
        "androidx.core_core"
        "androidx.media_media"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
        "androidx.appcompat_appcompat"
    ];
};

"androidx.leanback_leanback" = android_library {
    name = "androidx.leanback_leanback";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "17";
    manifest = "manifests/androidx.leanback_leanback/AndroidManifest.xml";
    static_libs = [
        "androidx.leanback_leanback-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.interpolator_interpolator"
        "androidx.core_core"
        "androidx.media_media"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
        "androidx.appcompat_appcompat"
    ];
    java_version = "1.7";
};

"androidx.legacy_legacy-support-core-utils-nodeps" = android_library_import {
    name = "androidx.legacy_legacy-support-core-utils-nodeps";
    aars = ["m2repository/androidx/legacy/legacy-support-core-utils/1.1.0-alpha01/legacy-support-core-utils-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.documentfile_documentfile"
        "androidx.loader_loader"
        "androidx.localbroadcastmanager_localbroadcastmanager"
        "androidx.print_print"
    ];
};

"androidx.legacy_legacy-support-core-utils" = android_library {
    name = "androidx.legacy_legacy-support-core-utils";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.legacy_legacy-support-core-utils/AndroidManifest.xml";
    static_libs = [
        "androidx.legacy_legacy-support-core-utils-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.documentfile_documentfile"
        "androidx.loader_loader"
        "androidx.localbroadcastmanager_localbroadcastmanager"
        "androidx.print_print"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-common-java8-nodeps" = java_import {
    name = "androidx.lifecycle_lifecycle-common-java8-nodeps";
    jars = ["m2repository/androidx/lifecycle/lifecycle-common-java8/2.3.0-alpha05/lifecycle-common-java8-2.3.0-alpha05.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.lifecycle_lifecycle-common-java8" = java_library_static {
    name = "androidx.lifecycle_lifecycle-common-java8";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.lifecycle_lifecycle-common-java8-nodeps"
        "androidx.lifecycle_lifecycle-common"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-common-nodeps" = java_import {
    name = "androidx.lifecycle_lifecycle-common-nodeps";
    jars = ["m2repository/androidx/lifecycle/lifecycle-common/2.3.0-alpha05/lifecycle-common-2.3.0-alpha05.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.lifecycle_lifecycle-common" = java_library_static {
    name = "androidx.lifecycle_lifecycle-common";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.lifecycle_lifecycle-common-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-livedata-core-ktx-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-livedata-core-ktx-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-livedata-core-ktx/2.3.0-alpha05/lifecycle-livedata-core-ktx-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.lifecycle_lifecycle-livedata-core"
    ];
};

"androidx.lifecycle_lifecycle-livedata-core-ktx" = android_library {
    name = "androidx.lifecycle_lifecycle-livedata-core-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-livedata-core-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-livedata-core-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.lifecycle_lifecycle-livedata-core"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-livedata-core-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-livedata-core-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-livedata-core/2.3.0-alpha05/lifecycle-livedata-core-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.lifecycle_lifecycle-common"
        "androidx.arch.core_core-common"
        "androidx.arch.core_core-runtime"
    ];
};

"androidx.lifecycle_lifecycle-livedata-core" = android_library {
    name = "androidx.lifecycle_lifecycle-livedata-core";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-livedata-core/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-livedata-core-nodeps"
        "androidx.lifecycle_lifecycle-common"
        "androidx.arch.core_core-common"
        "androidx.arch.core_core-runtime"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-livedata-ktx-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-livedata-ktx-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-livedata-ktx/2.3.0-alpha05/lifecycle-livedata-ktx-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "kotlinx-coroutines-core"
        "androidx.lifecycle_lifecycle-livedata"
        "androidx.lifecycle_lifecycle-livedata-core-ktx"
    ];
};

"androidx.lifecycle_lifecycle-livedata-ktx" = android_library {
    name = "androidx.lifecycle_lifecycle-livedata-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-livedata-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-livedata-ktx-nodeps"
        "kotlin-stdlib"
        "kotlinx-coroutines-core"
        "androidx.lifecycle_lifecycle-livedata"
        "androidx.lifecycle_lifecycle-livedata-core-ktx"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-livedata-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-livedata-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-livedata/2.3.0-alpha05/lifecycle-livedata-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.arch.core_core-common"
        "androidx.arch.core_core-runtime"
        "androidx.lifecycle_lifecycle-livedata-core"
    ];
};

"androidx.lifecycle_lifecycle-livedata" = android_library {
    name = "androidx.lifecycle_lifecycle-livedata";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-livedata/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-livedata-nodeps"
        "androidx.arch.core_core-common"
        "androidx.arch.core_core-runtime"
        "androidx.lifecycle_lifecycle-livedata-core"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-process-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-process-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-process/2.3.0-alpha05/lifecycle-process-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.lifecycle_lifecycle-runtime"
    ];
};

"androidx.lifecycle_lifecycle-process" = android_library {
    name = "androidx.lifecycle_lifecycle-process";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-process/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-process-nodeps"
        "androidx.lifecycle_lifecycle-runtime"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-runtime-ktx-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-runtime-ktx-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-runtime-ktx/2.3.0-alpha05/lifecycle-runtime-ktx-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.annotation_annotation"
        "androidx.lifecycle_lifecycle-runtime"
    ];
};

"androidx.lifecycle_lifecycle-runtime-ktx" = android_library {
    name = "androidx.lifecycle_lifecycle-runtime-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-runtime-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-runtime-ktx-nodeps"
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.annotation_annotation"
        "androidx.lifecycle_lifecycle-runtime"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-runtime-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-runtime-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-runtime/2.3.0-alpha05/lifecycle-runtime-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.lifecycle_lifecycle-common"
        "androidx.arch.core_core-common"
        "androidx.annotation_annotation"
    ];
};

"androidx.lifecycle_lifecycle-runtime" = android_library {
    name = "androidx.lifecycle_lifecycle-runtime";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-runtime/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-runtime-nodeps"
        "androidx.lifecycle_lifecycle-common"
        "androidx.arch.core_core-common"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-service-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-service-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-service/2.3.0-alpha05/lifecycle-service-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.lifecycle_lifecycle-runtime"
    ];
};

"androidx.lifecycle_lifecycle-service" = android_library {
    name = "androidx.lifecycle_lifecycle-service";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-service/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-service-nodeps"
        "androidx.lifecycle_lifecycle-runtime"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-viewmodel-ktx-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-viewmodel-ktx-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-viewmodel-ktx/2.3.0-alpha05/lifecycle-viewmodel-ktx-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
};

"androidx.lifecycle_lifecycle-viewmodel-ktx" = android_library {
    name = "androidx.lifecycle_lifecycle-viewmodel-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-viewmodel-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-viewmodel-ktx-nodeps"
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-viewmodel-savedstate/2.3.0-alpha05/lifecycle-viewmodel-savedstate-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-livedata-core"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
};

"androidx.lifecycle_lifecycle-viewmodel-savedstate" = android_library {
    name = "androidx.lifecycle_lifecycle-viewmodel-savedstate";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-viewmodel-savedstate/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps"
        "androidx.annotation_annotation"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-livedata-core"
        "androidx.lifecycle_lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

"androidx.lifecycle_lifecycle-viewmodel-nodeps" = android_library_import {
    name = "androidx.lifecycle_lifecycle-viewmodel-nodeps";
    aars = ["m2repository/androidx/lifecycle/lifecycle-viewmodel/2.3.0-alpha05/lifecycle-viewmodel-2.3.0-alpha05.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.lifecycle_lifecycle-viewmodel" = android_library {
    name = "androidx.lifecycle_lifecycle-viewmodel";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.lifecycle_lifecycle-viewmodel/AndroidManifest.xml";
    static_libs = [
        "androidx.lifecycle_lifecycle-viewmodel-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.loader_loader-nodeps" = android_library_import {
    name = "androidx.loader_loader-nodeps";
    aars = ["m2repository/androidx/loader/loader/1.2.0-alpha01/loader-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.core_core"
        "androidx.lifecycle_lifecycle-livedata-core"
    ];
};

"androidx.loader_loader" = android_library {
    name = "androidx.loader_loader";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.loader_loader/AndroidManifest.xml";
    static_libs = [
        "androidx.loader_loader-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.core_core"
        "androidx.lifecycle_lifecycle-livedata-core"
    ];
    java_version = "1.7";
};

"androidx.localbroadcastmanager_localbroadcastmanager-nodeps" = android_library_import {
    name = "androidx.localbroadcastmanager_localbroadcastmanager-nodeps";
    aars = ["m2repository/androidx/localbroadcastmanager/localbroadcastmanager/1.1.0-alpha02/localbroadcastmanager-1.1.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.localbroadcastmanager_localbroadcastmanager" = android_library {
    name = "androidx.localbroadcastmanager_localbroadcastmanager";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.localbroadcastmanager_localbroadcastmanager/AndroidManifest.xml";
    static_libs = [
        "androidx.localbroadcastmanager_localbroadcastmanager-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.media_media-nodeps" = android_library_import {
    name = "androidx.media_media-nodeps";
    aars = ["m2repository/androidx/media/media/1.2.0-alpha04/media-1.2.0-alpha04.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.media_media" = android_library {
    name = "androidx.media_media";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.media_media/AndroidManifest.xml";
    static_libs = [
        "androidx.media_media-nodeps"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.media2_media2-common-nodeps" = android_library_import {
    name = "androidx.media2_media2-common-nodeps";
    aars = ["m2repository/androidx/media2/media2-common/1.1.0-alpha01/media2-common-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    static_libs = [
        "guava-listenablefuture-prebuilt-jar"
        "androidx.concurrent_concurrent-futures"
        "androidx.collection_collection"
        "androidx.media_media"
    ];
};

"androidx.media2_media2-common" = android_library {
    name = "androidx.media2_media2-common";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    manifest = "manifests/androidx.media2_media2-common/AndroidManifest.xml";
    static_libs = [
        "androidx.media2_media2-common-nodeps"
        "guava-listenablefuture-prebuilt-jar"
        "androidx.concurrent_concurrent-futures"
        "androidx.collection_collection"
        "androidx.media_media"
    ];
    java_version = "1.7";
};

"androidx.media2_media2-exoplayer-nodeps" = android_library_import {
    name = "androidx.media2_media2-exoplayer-nodeps";
    aars = ["m2repository/androidx/media2/media2-exoplayer/1.1.0-alpha01/media2-exoplayer-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
    ];
};

"androidx.media2_media2-exoplayer" = android_library {
    name = "androidx.media2_media2-exoplayer";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.media2_media2-exoplayer/AndroidManifest.xml";
    static_libs = [
        "androidx.media2_media2-exoplayer-nodeps"
    ];
    java_version = "1.7";
};

"androidx.media2_media2-player-nodeps" = android_library_import {
    name = "androidx.media2_media2-player-nodeps";
    aars = ["m2repository/androidx/media2/media2-player/1.1.0-alpha01/media2-player-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    static_libs = [
        "guava-listenablefuture-prebuilt-jar"
        "androidx.concurrent_concurrent-futures"
        "androidx.collection_collection"
        "androidx.media2_media2-common"
        "androidx.media2_media2-exoplayer"
    ];
};

"androidx.media2_media2-player" = android_library {
    name = "androidx.media2_media2-player";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    manifest = "manifests/androidx.media2_media2-player/AndroidManifest.xml";
    static_libs = [
        "androidx.media2_media2-player-nodeps"
        "guava-listenablefuture-prebuilt-jar"
        "androidx.concurrent_concurrent-futures"
        "androidx.collection_collection"
        "androidx.media2_media2-common"
        "androidx.media2_media2-exoplayer"
    ];
    java_version = "1.7";
};

"androidx.media2_media2-session-nodeps" = android_library_import {
    name = "androidx.media2_media2-session-nodeps";
    aars = ["m2repository/androidx/media2/media2-session/1.1.0-alpha01/media2-session-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    static_libs = [
        "guava-listenablefuture-prebuilt-jar"
        "androidx.concurrent_concurrent-futures"
        "androidx.collection_collection"
        "androidx.media2_media2-common"
    ];
};

"androidx.media2_media2-session" = android_library {
    name = "androidx.media2_media2-session";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    manifest = "manifests/androidx.media2_media2-session/AndroidManifest.xml";
    static_libs = [
        "androidx.media2_media2-session-nodeps"
        "guava-listenablefuture-prebuilt-jar"
        "androidx.concurrent_concurrent-futures"
        "androidx.collection_collection"
        "androidx.media2_media2-common"
    ];
    java_version = "1.7";
};

"androidx.media2_media2-widget-nodeps" = android_library_import {
    name = "androidx.media2_media2-widget-nodeps";
    aars = ["m2repository/androidx/media2/media2-widget/1.1.0-alpha01/media2-widget-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    static_libs = [
        "androidx.media2_media2-session"
        "androidx.appcompat_appcompat"
        "androidx.palette_palette"
    ];
};

"androidx.media2_media2-widget" = android_library {
    name = "androidx.media2_media2-widget";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "16";
    manifest = "manifests/androidx.media2_media2-widget/AndroidManifest.xml";
    static_libs = [
        "androidx.media2_media2-widget-nodeps"
        "androidx.media2_media2-session"
        "androidx.appcompat_appcompat"
        "androidx.palette_palette"
    ];
    java_version = "1.7";
};

"androidx.mediarouter_mediarouter-nodeps" = android_library_import {
    name = "androidx.mediarouter_mediarouter-nodeps";
    aars = ["m2repository/androidx/mediarouter/mediarouter/1.2.0-alpha01/mediarouter-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.media_media"
        "androidx.core_core"
        "androidx.appcompat_appcompat"
        "androidx.palette_palette"
        "androidx.recyclerview_recyclerview"
    ];
};

"androidx.mediarouter_mediarouter" = android_library {
    name = "androidx.mediarouter_mediarouter";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.mediarouter_mediarouter/AndroidManifest.xml";
    static_libs = [
        "androidx.mediarouter_mediarouter-nodeps"
        "androidx.media_media"
        "androidx.core_core"
        "androidx.appcompat_appcompat"
        "androidx.palette_palette"
        "androidx.recyclerview_recyclerview"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-common-ktx-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-common-ktx-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-common-ktx/2.4.0-alpha01/navigation-common-ktx-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.collection_collection"
        "androidx.navigation_navigation-common"
        "androidx.core_core-ktx"
    ];
};

"androidx.navigation_navigation-common-ktx" = android_library {
    name = "androidx.navigation_navigation-common-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-common-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-common-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.collection_collection"
        "androidx.navigation_navigation-common"
        "androidx.core_core-ktx"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-common-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-common-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-common/2.4.0-alpha01/navigation-common-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.navigation_navigation-common" = android_library {
    name = "androidx.navigation_navigation-common";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-common/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-common-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-fragment-ktx-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-fragment-ktx-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-fragment-ktx/2.4.0-alpha01/navigation-fragment-ktx-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.navigation_navigation-fragment"
        "androidx.navigation_navigation-runtime-ktx"
        "androidx.fragment_fragment-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
};

"androidx.navigation_navigation-fragment-ktx" = android_library {
    name = "androidx.navigation_navigation-fragment-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-fragment-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-fragment-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.navigation_navigation-fragment"
        "androidx.navigation_navigation-runtime-ktx"
        "androidx.fragment_fragment-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-fragment-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-fragment-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-fragment/2.4.0-alpha01/navigation-fragment-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.fragment_fragment"
        "androidx.navigation_navigation-runtime"
    ];
};

"androidx.navigation_navigation-fragment" = android_library {
    name = "androidx.navigation_navigation-fragment";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-fragment/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-fragment-nodeps"
        "androidx.fragment_fragment"
        "androidx.navigation_navigation-runtime"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-runtime-ktx-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-runtime-ktx-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-runtime-ktx/2.4.0-alpha01/navigation-runtime-ktx-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.navigation_navigation-runtime"
        "androidx.navigation_navigation-common-ktx"
        "androidx.activity_activity-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
};

"androidx.navigation_navigation-runtime-ktx" = android_library {
    name = "androidx.navigation_navigation-runtime-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-runtime-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-runtime-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.navigation_navigation-runtime"
        "androidx.navigation_navigation-common-ktx"
        "androidx.activity_activity-ktx"
        "androidx.lifecycle_lifecycle-viewmodel-ktx"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-runtime-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-runtime-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-runtime/2.4.0-alpha01/navigation-runtime-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.navigation_navigation-common"
        "androidx.activity_activity"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-viewmodel-savedstate"
    ];
};

"androidx.navigation_navigation-runtime" = android_library {
    name = "androidx.navigation_navigation-runtime";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-runtime/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-runtime-nodeps"
        "androidx.navigation_navigation-common"
        "androidx.activity_activity"
        "androidx.lifecycle_lifecycle-viewmodel"
        "androidx.savedstate_savedstate"
        "androidx.lifecycle_lifecycle-viewmodel-savedstate"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-ui-ktx-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-ui-ktx-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-ui-ktx/2.4.0-alpha01/navigation-ui-ktx-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "kotlin-stdlib"
        "androidx.navigation_navigation-ui"
        "androidx.navigation_navigation-runtime-ktx"
    ];
};

"androidx.navigation_navigation-ui-ktx" = android_library {
    name = "androidx.navigation_navigation-ui-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-ui-ktx/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-ui-ktx-nodeps"
        "kotlin-stdlib"
        "androidx.navigation_navigation-ui"
        "androidx.navigation_navigation-runtime-ktx"
    ];
    java_version = "1.7";
};

"androidx.navigation_navigation-ui-nodeps" = android_library_import {
    name = "androidx.navigation_navigation-ui-nodeps";
    aars = ["m2repository/androidx/navigation/navigation-ui/2.4.0-alpha01/navigation-ui-2.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "com.google.android.material_material"
        "androidx.navigation_navigation-runtime"
        "androidx.customview_customview"
        "androidx.drawerlayout_drawerlayout"
        "androidx.transition_transition"
    ];
};

"androidx.navigation_navigation-ui" = android_library {
    name = "androidx.navigation_navigation-ui";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.navigation_navigation-ui/AndroidManifest.xml";
    static_libs = [
        "androidx.navigation_navigation-ui-nodeps"
        "com.google.android.material_material"
        "androidx.navigation_navigation-runtime"
        "androidx.customview_customview"
        "androidx.drawerlayout_drawerlayout"
        "androidx.transition_transition"
    ];
    java_version = "1.7";
};

"androidx.paging_paging-common-ktx-nodeps" = java_import {
    name = "androidx.paging_paging-common-ktx-nodeps";
    jars = ["m2repository/androidx/paging/paging-common-ktx/3.0.0-alpha02/paging-common-ktx-3.0.0-alpha02.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.paging_paging-common-ktx" = java_library_static {
    name = "androidx.paging_paging-common-ktx";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.paging_paging-common-ktx-nodeps"
        "androidx.paging_paging-common"
    ];
    java_version = "1.7";
};

"androidx.paging_paging-common-nodeps" = java_import {
    name = "androidx.paging_paging-common-nodeps";
    jars = ["m2repository/androidx/paging/paging-common/3.0.0-alpha02/paging-common-3.0.0-alpha02.jar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.paging_paging-common" = java_library_static {
    name = "androidx.paging_paging-common";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.paging_paging-common-nodeps"
        "androidx.annotation_annotation"
        "androidx.arch.core_core-common"
        "kotlin-stdlib"
        "kotlinx-coroutines-core"
    ];
    java_version = "1.7";
};

"androidx.paging_paging-runtime-nodeps" = android_library_import {
    name = "androidx.paging_paging-runtime-nodeps";
    aars = ["m2repository/androidx/paging/paging-runtime/3.0.0-alpha02/paging-runtime-3.0.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.paging_paging-common"
        "androidx.paging_paging-common-ktx"
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.lifecycle_lifecycle-runtime-ktx"
        "androidx.lifecycle_lifecycle-livedata-ktx"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core-ktx"
    ];
};

"androidx.paging_paging-runtime" = android_library {
    name = "androidx.paging_paging-runtime";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.paging_paging-runtime/AndroidManifest.xml";
    static_libs = [
        "androidx.paging_paging-runtime-nodeps"
        "androidx.paging_paging-common"
        "androidx.paging_paging-common-ktx"
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.lifecycle_lifecycle-runtime-ktx"
        "androidx.lifecycle_lifecycle-livedata-ktx"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core-ktx"
    ];
    java_version = "1.7";
};

"androidx.palette_palette-nodeps" = android_library_import {
    name = "androidx.palette_palette-nodeps";
    aars = ["m2repository/androidx/palette/palette/1.1.0-alpha01/palette-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.palette_palette" = android_library {
    name = "androidx.palette_palette";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.palette_palette/AndroidManifest.xml";
    static_libs = [
        "androidx.palette_palette-nodeps"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.percentlayout_percentlayout-nodeps" = android_library_import {
    name = "androidx.percentlayout_percentlayout-nodeps";
    aars = ["m2repository/androidx/percentlayout/percentlayout/1.1.0-alpha01/percentlayout-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.percentlayout_percentlayout" = android_library {
    name = "androidx.percentlayout_percentlayout";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.percentlayout_percentlayout/AndroidManifest.xml";
    static_libs = [
        "androidx.percentlayout_percentlayout-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.preference_preference-nodeps" = android_library_import {
    name = "androidx.preference_preference-nodeps";
    aars = ["m2repository/androidx/preference/preference/1.2.0-alpha01/preference-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
    ];
};

"androidx.preference_preference" = android_library {
    name = "androidx.preference_preference";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.preference_preference/AndroidManifest.xml";
    static_libs = [
        "androidx.preference_preference-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
        "androidx.core_core"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
    ];
    java_version = "1.7";
};

"androidx.print_print-nodeps" = android_library_import {
    name = "androidx.print_print-nodeps";
    aars = ["m2repository/androidx/print/print/1.1.0-alpha01/print-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.print_print" = android_library {
    name = "androidx.print_print";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.print_print/AndroidManifest.xml";
    static_libs = [
        "androidx.print_print-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.recommendation_recommendation-nodeps" = android_library_import {
    name = "androidx.recommendation_recommendation-nodeps";
    aars = ["m2repository/androidx/recommendation/recommendation/1.1.0-alpha01/recommendation-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "21";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.recommendation_recommendation" = android_library {
    name = "androidx.recommendation_recommendation";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "21";
    manifest = "manifests/androidx.recommendation_recommendation/AndroidManifest.xml";
    static_libs = [
        "androidx.recommendation_recommendation-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.recyclerview_recyclerview-selection-nodeps" = android_library_import {
    name = "androidx.recyclerview_recyclerview-selection-nodeps";
    aars = ["m2repository/androidx/recyclerview/recyclerview-selection/2.0.0-alpha01/recyclerview-selection-2.0.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
    ];
};

"androidx.recyclerview_recyclerview-selection" = android_library {
    name = "androidx.recyclerview_recyclerview-selection";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.recyclerview_recyclerview-selection/AndroidManifest.xml";
    static_libs = [
        "androidx.recyclerview_recyclerview-selection-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.recyclerview_recyclerview-nodeps" = android_library_import {
    name = "androidx.recyclerview_recyclerview-nodeps";
    aars = ["m2repository/androidx/recyclerview/recyclerview/1.2.0-alpha04/recyclerview-1.2.0-alpha04.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.customview_customview"
    ];
};

"androidx.recyclerview_recyclerview" = android_library {
    name = "androidx.recyclerview_recyclerview";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.recyclerview_recyclerview/AndroidManifest.xml";
    static_libs = [
        "androidx.recyclerview_recyclerview-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
        "androidx.customview_customview"
    ];
    java_version = "1.7";
};

"androidx.remotecallback_remotecallback-processor-nodeps" = java_import_host {
    name = "androidx.remotecallback_remotecallback-processor-nodeps";
    jars = ["m2repository/androidx/remotecallback/remotecallback-processor/1.0.0-alpha02/remotecallback-processor-1.0.0-alpha02.jar"];
    sdk_version = "current";
};

"androidx.remotecallback_remotecallback-processor" = java_library_host {
    name = "androidx.remotecallback_remotecallback-processor";
    static_libs = [
        "androidx.remotecallback_remotecallback-processor-nodeps"
        "androidx.annotation_annotation"
        "javapoet-prebuilt-jar"
    ];
    java_version = "1.7";
};

"androidx.remotecallback_remotecallback-nodeps" = android_library_import {
    name = "androidx.remotecallback_remotecallback-nodeps";
    aars = ["m2repository/androidx/remotecallback/remotecallback/1.0.0-alpha02/remotecallback-1.0.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
    ];
};

"androidx.remotecallback_remotecallback" = android_library {
    name = "androidx.remotecallback_remotecallback";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.remotecallback_remotecallback/AndroidManifest.xml";
    static_libs = [
        "androidx.remotecallback_remotecallback-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
    ];
    java_version = "1.7";
};

"androidx.room_room-common-nodeps" = java_import {
    name = "androidx.room_room-common-nodeps";
    jars = ["m2repository/androidx/room/room-common/2.3.0-alpha02/room-common-2.3.0-alpha02.jar"];
    sdk_version = "current";
    host_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.room_room-common" = java_library_static {
    name = "androidx.room_room-common";
    sdk_version = "current";
    host_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.room_room-common-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.room_room-compiler-nodeps" = java_import_host {
    name = "androidx.room_room-compiler-nodeps";
    jars = ["m2repository/androidx/room/room-compiler/2.3.0-alpha02/room-compiler-2.3.0-alpha02.jar"];
    sdk_version = "current";
};

"androidx.room_room-compiler" = java_library_host {
    name = "androidx.room_room-compiler";
    static_libs = [
        "androidx.room_room-compiler-nodeps"
        "androidx.room_room-common"
        "androidx.room_room-migration"
        "kotlin-stdlib"
        "auto-common"
        "auto-value-annotations"
        "javapoet-prebuilt-jar"
        "xerial-sqlite-jdbc"
        "kotlinx-metadata-jvm"
        "commons-codec"
        "jetbrains-annotations"
        "guava-21.0"
    ];
    java_version = "1.7";
};

"androidx.room_room-migration-nodeps" = java_import {
    name = "androidx.room_room-migration-nodeps";
    jars = ["m2repository/androidx/room/room-migration/2.3.0-alpha02/room-migration-2.3.0-alpha02.jar"];
    sdk_version = "current";
    host_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
};

"androidx.room_room-migration" = java_library_static {
    name = "androidx.room_room-migration";
    sdk_version = "current";
    host_supported = true;
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "24";
    static_libs = [
        "androidx.room_room-migration-nodeps"
        "androidx.room_room-common"
        "kotlin-stdlib"
        "gson-prebuilt-jar"
    ];
    java_version = "1.7";
};

"androidx.room_room-runtime-nodeps" = android_library_import {
    name = "androidx.room_room-runtime-nodeps";
    aars = ["m2repository/androidx/room/room-runtime/2.3.0-alpha02/room-runtime-2.3.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.room_room-common"
        "androidx.sqlite_sqlite-framework"
        "androidx.sqlite_sqlite"
        "androidx.arch.core_core-runtime"
    ];
};

"androidx.room_room-runtime" = android_library {
    name = "androidx.room_room-runtime";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.room_room-runtime/AndroidManifest.xml";
    static_libs = [
        "androidx.room_room-runtime-nodeps"
        "androidx.room_room-common"
        "androidx.sqlite_sqlite-framework"
        "androidx.sqlite_sqlite"
        "androidx.arch.core_core-runtime"
    ];
    java_version = "1.7";
};

"androidx.room_room-testing-nodeps" = android_library_import {
    name = "androidx.room_room-testing-nodeps";
    aars = ["m2repository/androidx/room/room-testing/2.3.0-alpha02/room-testing-2.3.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.room_room-common"
        "androidx.room_room-migration"
        "junit"
        "androidx.room_room-runtime"
        "androidx.sqlite_sqlite"
        "androidx.sqlite_sqlite-framework"
        "androidx.arch.core_core-runtime"
    ];
};

"androidx.room_room-testing" = android_library {
    name = "androidx.room_room-testing";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.room_room-testing/AndroidManifest.xml";
    static_libs = [
        "androidx.room_room-testing-nodeps"
        "androidx.room_room-common"
        "androidx.room_room-migration"
        "junit"
        "androidx.room_room-runtime"
        "androidx.sqlite_sqlite"
        "androidx.sqlite_sqlite-framework"
        "androidx.arch.core_core-runtime"
    ];
    java_version = "1.7";
};

"androidx.savedstate_savedstate-nodeps" = android_library_import {
    name = "androidx.savedstate_savedstate-nodeps";
    aars = ["m2repository/androidx/savedstate/savedstate/1.1.0-alpha01/savedstate-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.arch.core_core-common"
        "androidx.lifecycle_lifecycle-common"
    ];
};

"androidx.savedstate_savedstate" = android_library {
    name = "androidx.savedstate_savedstate";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.savedstate_savedstate/AndroidManifest.xml";
    static_libs = [
        "androidx.savedstate_savedstate-nodeps"
        "androidx.annotation_annotation"
        "androidx.arch.core_core-common"
        "androidx.lifecycle_lifecycle-common"
    ];
    java_version = "1.7";
};

"androidx.slice_slice-builders-nodeps" = android_library_import {
    name = "androidx.slice_slice-builders-nodeps";
    aars = ["m2repository/androidx/slice/slice-builders/1.1.0-alpha02/slice-builders-1.1.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.remotecallback_remotecallback"
        "androidx.slice_slice-core"
        "androidx.core_core"
    ];
};

"androidx.slice_slice-builders" = android_library {
    name = "androidx.slice_slice-builders";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.slice_slice-builders/AndroidManifest.xml";
    static_libs = [
        "androidx.slice_slice-builders-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.remotecallback_remotecallback"
        "androidx.slice_slice-core"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.slice_slice-core-nodeps" = android_library_import {
    name = "androidx.slice_slice-core-nodeps";
    aars = ["m2repository/androidx/slice/slice-core/1.1.0-alpha02/slice-core-1.1.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
    ];
};

"androidx.slice_slice-core" = android_library {
    name = "androidx.slice_slice-core";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.slice_slice-core/AndroidManifest.xml";
    static_libs = [
        "androidx.slice_slice-core-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
    ];
    java_version = "1.7";
};

"androidx.slice_slice-view-nodeps" = android_library_import {
    name = "androidx.slice_slice-view-nodeps";
    aars = ["m2repository/androidx/slice/slice-view/1.1.0-alpha02/slice-view-1.1.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection"
        "androidx.lifecycle_lifecycle-livedata-core"
        "androidx.slice_slice-core"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
    ];
};

"androidx.slice_slice-view" = android_library {
    name = "androidx.slice_slice-view";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.slice_slice-view/AndroidManifest.xml";
    static_libs = [
        "androidx.slice_slice-view-nodeps"
        "androidx.collection_collection"
        "androidx.lifecycle_lifecycle-livedata-core"
        "androidx.slice_slice-core"
        "androidx.appcompat_appcompat"
        "androidx.recyclerview_recyclerview"
    ];
    java_version = "1.7";
};

"androidx.slidingpanelayout_slidingpanelayout-nodeps" = android_library_import {
    name = "androidx.slidingpanelayout_slidingpanelayout-nodeps";
    aars = ["m2repository/androidx/slidingpanelayout/slidingpanelayout/1.2.0-alpha01/slidingpanelayout-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.customview_customview"
        "androidx.core_core"
    ];
};

"androidx.slidingpanelayout_slidingpanelayout" = android_library {
    name = "androidx.slidingpanelayout_slidingpanelayout";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.slidingpanelayout_slidingpanelayout/AndroidManifest.xml";
    static_libs = [
        "androidx.slidingpanelayout_slidingpanelayout-nodeps"
        "androidx.annotation_annotation"
        "androidx.customview_customview"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.sqlite_sqlite-framework-nodeps" = android_library_import {
    name = "androidx.sqlite_sqlite-framework-nodeps";
    aars = ["m2repository/androidx/sqlite/sqlite-framework/2.1.0-rc01/sqlite-framework-2.1.0-rc01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.sqlite_sqlite"
    ];
};

"androidx.sqlite_sqlite-framework" = android_library {
    name = "androidx.sqlite_sqlite-framework";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.sqlite_sqlite-framework/AndroidManifest.xml";
    static_libs = [
        "androidx.sqlite_sqlite-framework-nodeps"
        "androidx.annotation_annotation"
        "androidx.sqlite_sqlite"
    ];
    java_version = "1.7";
};

"androidx.sqlite_sqlite-nodeps" = android_library_import {
    name = "androidx.sqlite_sqlite-nodeps";
    aars = ["m2repository/androidx/sqlite/sqlite/2.1.0-rc01/sqlite-2.1.0-rc01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

"androidx.sqlite_sqlite" = android_library {
    name = "androidx.sqlite_sqlite";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.sqlite_sqlite/AndroidManifest.xml";
    static_libs = [
        "androidx.sqlite_sqlite-nodeps"
        "androidx.annotation_annotation"
    ];
    java_version = "1.7";
};

"androidx.swiperefreshlayout_swiperefreshlayout-nodeps" = android_library_import {
    name = "androidx.swiperefreshlayout_swiperefreshlayout-nodeps";
    aars = ["m2repository/androidx/swiperefreshlayout/swiperefreshlayout/1.1.0-rc01/swiperefreshlayout-1.1.0-rc01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.interpolator_interpolator"
    ];
};

"androidx.swiperefreshlayout_swiperefreshlayout" = android_library {
    name = "androidx.swiperefreshlayout_swiperefreshlayout";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.swiperefreshlayout_swiperefreshlayout/AndroidManifest.xml";
    static_libs = [
        "androidx.swiperefreshlayout_swiperefreshlayout-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
        "androidx.interpolator_interpolator"
    ];
    java_version = "1.7";
};

"androidx.textclassifier_textclassifier-nodeps" = android_library_import {
    name = "androidx.textclassifier_textclassifier-nodeps";
    aars = ["m2repository/androidx/textclassifier/textclassifier/1.0.0-alpha03/textclassifier-1.0.0-alpha03.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
        "androidx.core_core"
    ];
};

"androidx.textclassifier_textclassifier" = android_library {
    name = "androidx.textclassifier_textclassifier";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.textclassifier_textclassifier/AndroidManifest.xml";
    static_libs = [
        "androidx.textclassifier_textclassifier-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.appcompat_appcompat"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.transition_transition-nodeps" = android_library_import {
    name = "androidx.transition_transition-nodeps";
    aars = ["m2repository/androidx/transition/transition/1.4.0-alpha01/transition-1.4.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.transition_transition" = android_library {
    name = "androidx.transition_transition";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.transition_transition/AndroidManifest.xml";
    static_libs = [
        "androidx.transition_transition-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.tvprovider_tvprovider-nodeps" = android_library_import {
    name = "androidx.tvprovider_tvprovider-nodeps";
    aars = ["m2repository/androidx/tvprovider/tvprovider/1.1.0-alpha01/tvprovider-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "21";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.tvprovider_tvprovider" = android_library {
    name = "androidx.tvprovider_tvprovider";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "21";
    manifest = "manifests/androidx.tvprovider_tvprovider/AndroidManifest.xml";
    static_libs = [
        "androidx.tvprovider_tvprovider-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.vectordrawable_vectordrawable-animated-nodeps" = android_library_import {
    name = "androidx.vectordrawable_vectordrawable-animated-nodeps";
    aars = ["m2repository/androidx/vectordrawable/vectordrawable-animated/1.2.0-alpha01/vectordrawable-animated-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.collection_collection"
        "androidx.vectordrawable_vectordrawable"
        "androidx.interpolator_interpolator"
    ];
};

"androidx.vectordrawable_vectordrawable-animated" = android_library {
    name = "androidx.vectordrawable_vectordrawable-animated";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.vectordrawable_vectordrawable-animated/AndroidManifest.xml";
    static_libs = [
        "androidx.vectordrawable_vectordrawable-animated-nodeps"
        "androidx.collection_collection"
        "androidx.vectordrawable_vectordrawable"
        "androidx.interpolator_interpolator"
    ];
    java_version = "1.7";
};

"androidx.vectordrawable_vectordrawable-nodeps" = android_library_import {
    name = "androidx.vectordrawable_vectordrawable-nodeps";
    aars = ["m2repository/androidx/vectordrawable/vectordrawable/1.2.0-alpha02/vectordrawable-1.2.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
};

"androidx.vectordrawable_vectordrawable" = android_library {
    name = "androidx.vectordrawable_vectordrawable";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.vectordrawable_vectordrawable/AndroidManifest.xml";
    static_libs = [
        "androidx.vectordrawable_vectordrawable-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.versionedparcelable_versionedparcelable-nodeps" = android_library_import {
    name = "androidx.versionedparcelable_versionedparcelable-nodeps";
    aars = ["m2repository/androidx/versionedparcelable/versionedparcelable/1.2.0-alpha01/versionedparcelable-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
    ];
};

"androidx.versionedparcelable_versionedparcelable" = android_library {
    name = "androidx.versionedparcelable_versionedparcelable";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.versionedparcelable_versionedparcelable/AndroidManifest.xml";
    static_libs = [
        "androidx.versionedparcelable_versionedparcelable-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
    ];
    java_version = "1.7";
};

"androidx.viewpager_viewpager-nodeps" = android_library_import {
    name = "androidx.viewpager_viewpager-nodeps";
    aars = ["m2repository/androidx/viewpager/viewpager/1.1.0-alpha01/viewpager-1.1.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.customview_customview"
        "androidx.core_core"
    ];
};

"androidx.viewpager_viewpager" = android_library {
    name = "androidx.viewpager_viewpager";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.viewpager_viewpager/AndroidManifest.xml";
    static_libs = [
        "androidx.viewpager_viewpager-nodeps"
        "androidx.annotation_annotation"
        "androidx.customview_customview"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.viewpager2_viewpager2-nodeps" = android_library_import {
    name = "androidx.viewpager2_viewpager2-nodeps";
    aars = ["m2repository/androidx/viewpager2/viewpager2/1.1.0-alpha02/viewpager2-1.1.0-alpha02.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
    ];
};

"androidx.viewpager2_viewpager2" = android_library {
    name = "androidx.viewpager2_viewpager2";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.viewpager2_viewpager2/AndroidManifest.xml";
    static_libs = [
        "androidx.viewpager2_viewpager2-nodeps"
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

"androidx.wear_wear-nodeps" = android_library_import {
    name = "androidx.wear_wear-nodeps";
    aars = ["m2repository/androidx/wear/wear/1.2.0-alpha01/wear-1.2.0-alpha01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "23";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.swiperefreshlayout_swiperefreshlayout"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
        "androidx-constraintlayout_constraintlayout"
    ];
};

"androidx.wear_wear" = android_library {
    name = "androidx.wear_wear";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "23";
    manifest = "manifests/androidx.wear_wear/AndroidManifest.xml";
    static_libs = [
        "androidx.wear_wear-nodeps"
        "androidx.annotation_annotation"
        "androidx.swiperefreshlayout_swiperefreshlayout"
        "androidx.fragment_fragment"
        "androidx.recyclerview_recyclerview"
        "androidx.core_core"
        "androidx-constraintlayout_constraintlayout"
    ];
    java_version = "1.7";
};

"androidx.webkit_webkit-nodeps" = android_library_import {
    name = "androidx.webkit_webkit-nodeps";
    aars = ["m2repository/androidx/webkit/webkit/1.3.0-rc01/webkit-1.3.0-rc01.aar"];
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
};

"androidx.webkit_webkit" = android_library {
    name = "androidx.webkit_webkit";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform"
        "//apex_available:anyapex"
    ];
    min_sdk_version = "14";
    manifest = "manifests/androidx.webkit_webkit/AndroidManifest.xml";
    static_libs = [
        "androidx.webkit_webkit-nodeps"
        "androidx.annotation_annotation"
        "androidx.core_core"
    ];
    java_version = "1.7";
};

build = ["JavaPlugins.bp"];

in { inherit "androidx.activity_activity" "androidx.activity_activity-ktx" "androidx.activity_activity-ktx-nodeps" "androidx.activity_activity-nodeps" "androidx.annotation_annotation" "androidx.annotation_annotation-nodeps" "androidx.appcompat_appcompat" "androidx.appcompat_appcompat-nodeps" "androidx.appcompat_appcompat-resources" "androidx.appcompat_appcompat-resources-nodeps" "androidx.arch.core_core-common" "androidx.arch.core_core-common-nodeps" "androidx.arch.core_core-runtime" "androidx.arch.core_core-runtime-nodeps" "androidx.asynclayoutinflater_asynclayoutinflater" "androidx.asynclayoutinflater_asynclayoutinflater-nodeps" "androidx.autofill_autofill" "androidx.autofill_autofill-nodeps" "androidx.biometric_biometric" "androidx.biometric_biometric-nodeps" "androidx.browser_browser" "androidx.browser_browser-nodeps" "androidx.cardview_cardview" "androidx.cardview_cardview-nodeps" "androidx.collection_collection" "androidx.collection_collection-ktx" "androidx.collection_collection-ktx-nodeps" "androidx.collection_collection-nodeps" "androidx.concurrent_concurrent-futures" "androidx.concurrent_concurrent-futures-nodeps" "androidx.coordinatorlayout_coordinatorlayout" "androidx.coordinatorlayout_coordinatorlayout-nodeps" "androidx.core_core" "androidx.core_core-animation" "androidx.core_core-animation-nodeps" "androidx.core_core-ktx" "androidx.core_core-ktx-nodeps" "androidx.core_core-nodeps" "androidx.cursoradapter_cursoradapter" "androidx.cursoradapter_cursoradapter-nodeps" "androidx.customview_customview" "androidx.customview_customview-nodeps" "androidx.documentfile_documentfile" "androidx.documentfile_documentfile-nodeps" "androidx.drawerlayout_drawerlayout" "androidx.drawerlayout_drawerlayout-nodeps" "androidx.dynamicanimation_dynamicanimation" "androidx.dynamicanimation_dynamicanimation-nodeps" "androidx.emoji_emoji" "androidx.emoji_emoji-appcompat" "androidx.emoji_emoji-appcompat-nodeps" "androidx.emoji_emoji-bundled" "androidx.emoji_emoji-bundled-nodeps" "androidx.emoji_emoji-nodeps" "androidx.exifinterface_exifinterface" "androidx.exifinterface_exifinterface-nodeps" "androidx.fragment_fragment" "androidx.fragment_fragment-ktx" "androidx.fragment_fragment-ktx-nodeps" "androidx.fragment_fragment-nodeps" "androidx.gridlayout_gridlayout" "androidx.gridlayout_gridlayout-nodeps" "androidx.heifwriter_heifwriter" "androidx.heifwriter_heifwriter-nodeps" "androidx.interpolator_interpolator" "androidx.interpolator_interpolator-nodeps" "androidx.leanback_leanback" "androidx.leanback_leanback-nodeps" "androidx.leanback_leanback-preference" "androidx.leanback_leanback-preference-nodeps" "androidx.legacy_legacy-support-core-utils" "androidx.legacy_legacy-support-core-utils-nodeps" "androidx.lifecycle_lifecycle-common" "androidx.lifecycle_lifecycle-common-java8" "androidx.lifecycle_lifecycle-common-java8-nodeps" "androidx.lifecycle_lifecycle-common-nodeps" "androidx.lifecycle_lifecycle-livedata" "androidx.lifecycle_lifecycle-livedata-core" "androidx.lifecycle_lifecycle-livedata-core-ktx" "androidx.lifecycle_lifecycle-livedata-core-ktx-nodeps" "androidx.lifecycle_lifecycle-livedata-core-nodeps" "androidx.lifecycle_lifecycle-livedata-ktx" "androidx.lifecycle_lifecycle-livedata-ktx-nodeps" "androidx.lifecycle_lifecycle-livedata-nodeps" "androidx.lifecycle_lifecycle-process" "androidx.lifecycle_lifecycle-process-nodeps" "androidx.lifecycle_lifecycle-runtime" "androidx.lifecycle_lifecycle-runtime-ktx" "androidx.lifecycle_lifecycle-runtime-ktx-nodeps" "androidx.lifecycle_lifecycle-runtime-nodeps" "androidx.lifecycle_lifecycle-service" "androidx.lifecycle_lifecycle-service-nodeps" "androidx.lifecycle_lifecycle-viewmodel" "androidx.lifecycle_lifecycle-viewmodel-ktx" "androidx.lifecycle_lifecycle-viewmodel-ktx-nodeps" "androidx.lifecycle_lifecycle-viewmodel-nodeps" "androidx.lifecycle_lifecycle-viewmodel-savedstate" "androidx.lifecycle_lifecycle-viewmodel-savedstate-nodeps" "androidx.loader_loader" "androidx.loader_loader-nodeps" "androidx.localbroadcastmanager_localbroadcastmanager" "androidx.localbroadcastmanager_localbroadcastmanager-nodeps" "androidx.media2_media2-common" "androidx.media2_media2-common-nodeps" "androidx.media2_media2-exoplayer" "androidx.media2_media2-exoplayer-nodeps" "androidx.media2_media2-player" "androidx.media2_media2-player-nodeps" "androidx.media2_media2-session" "androidx.media2_media2-session-nodeps" "androidx.media2_media2-widget" "androidx.media2_media2-widget-nodeps" "androidx.media_media" "androidx.media_media-nodeps" "androidx.mediarouter_mediarouter" "androidx.mediarouter_mediarouter-nodeps" "androidx.navigation_navigation-common" "androidx.navigation_navigation-common-ktx" "androidx.navigation_navigation-common-ktx-nodeps" "androidx.navigation_navigation-common-nodeps" "androidx.navigation_navigation-fragment" "androidx.navigation_navigation-fragment-ktx" "androidx.navigation_navigation-fragment-ktx-nodeps" "androidx.navigation_navigation-fragment-nodeps" "androidx.navigation_navigation-runtime" "androidx.navigation_navigation-runtime-ktx" "androidx.navigation_navigation-runtime-ktx-nodeps" "androidx.navigation_navigation-runtime-nodeps" "androidx.navigation_navigation-ui" "androidx.navigation_navigation-ui-ktx" "androidx.navigation_navigation-ui-ktx-nodeps" "androidx.navigation_navigation-ui-nodeps" "androidx.paging_paging-common" "androidx.paging_paging-common-ktx" "androidx.paging_paging-common-ktx-nodeps" "androidx.paging_paging-common-nodeps" "androidx.paging_paging-runtime" "androidx.paging_paging-runtime-nodeps" "androidx.palette_palette" "androidx.palette_palette-nodeps" "androidx.percentlayout_percentlayout" "androidx.percentlayout_percentlayout-nodeps" "androidx.preference_preference" "androidx.preference_preference-nodeps" "androidx.print_print" "androidx.print_print-nodeps" "androidx.recommendation_recommendation" "androidx.recommendation_recommendation-nodeps" "androidx.recyclerview_recyclerview" "androidx.recyclerview_recyclerview-nodeps" "androidx.recyclerview_recyclerview-selection" "androidx.recyclerview_recyclerview-selection-nodeps" "androidx.remotecallback_remotecallback" "androidx.remotecallback_remotecallback-nodeps" "androidx.remotecallback_remotecallback-processor" "androidx.remotecallback_remotecallback-processor-nodeps" "androidx.room_room-common" "androidx.room_room-common-nodeps" "androidx.room_room-compiler" "androidx.room_room-compiler-nodeps" "androidx.room_room-migration" "androidx.room_room-migration-nodeps" "androidx.room_room-runtime" "androidx.room_room-runtime-nodeps" "androidx.room_room-testing" "androidx.room_room-testing-nodeps" "androidx.savedstate_savedstate" "androidx.savedstate_savedstate-nodeps" "androidx.slice_slice-builders" "androidx.slice_slice-builders-nodeps" "androidx.slice_slice-core" "androidx.slice_slice-core-nodeps" "androidx.slice_slice-view" "androidx.slice_slice-view-nodeps" "androidx.slidingpanelayout_slidingpanelayout" "androidx.slidingpanelayout_slidingpanelayout-nodeps" "androidx.sqlite_sqlite" "androidx.sqlite_sqlite-framework" "androidx.sqlite_sqlite-framework-nodeps" "androidx.sqlite_sqlite-nodeps" "androidx.swiperefreshlayout_swiperefreshlayout" "androidx.swiperefreshlayout_swiperefreshlayout-nodeps" "androidx.textclassifier_textclassifier" "androidx.textclassifier_textclassifier-nodeps" "androidx.transition_transition" "androidx.transition_transition-nodeps" "androidx.tvprovider_tvprovider" "androidx.tvprovider_tvprovider-nodeps" "androidx.vectordrawable_vectordrawable" "androidx.vectordrawable_vectordrawable-animated" "androidx.vectordrawable_vectordrawable-animated-nodeps" "androidx.vectordrawable_vectordrawable-nodeps" "androidx.versionedparcelable_versionedparcelable" "androidx.versionedparcelable_versionedparcelable-nodeps" "androidx.viewpager2_viewpager2" "androidx.viewpager2_viewpager2-nodeps" "androidx.viewpager_viewpager" "androidx.viewpager_viewpager-nodeps" "androidx.wear_wear" "androidx.wear_wear-nodeps" "androidx.webkit_webkit" "androidx.webkit_webkit-nodeps"; }

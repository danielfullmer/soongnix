{ android_library, android_library_import, java_import, java_library_static }:
let

#  Automatically generated with:
#  pom2bp -sdk-version current -static-deps '-rewrite=^android.arch.core:common$=android-arch-core-common' '-rewrite=^android.arch.core:runtime$=android-arch-core-runtime' '-rewrite=^android.arch.lifecycle:common$=android-arch-lifecycle-common' '-rewrite=^android.arch.lifecycle:common-java8$=android-arch-lifecycle-common-java8' '-rewrite=^android.arch.lifecycle:extensions$=android-arch-lifecycle-extensions' '-rewrite=^android.arch.lifecycle:livedata$=android-arch-lifecycle-livedata' '-rewrite=^android.arch.lifecycle:livedata-core$=android-arch-lifecycle-livedata-core' '-rewrite=^android.arch.lifecycle:process$=android-arch-lifecycle-process' '-rewrite=^android.arch.lifecycle:runtime$=android-arch-lifecycle-runtime' '-rewrite=^android.arch.lifecycle:service$=android-arch-lifecycle-service' '-rewrite=^android.arch.lifecycle:viewmodel$=android-arch-lifecycle-viewmodel' '-rewrite=^android.arch.paging:common$=android-arch-paging-common' '-rewrite=^android.arch.paging:runtime$=android-arch-paging-runtime' '-rewrite=^android.arch.persistence.room:common$=android-arch-room-common' '-rewrite=^android.arch.persistence.room:migration$=android-arch-room-migration' '-rewrite=^android.arch.persistence.room:runtime$=android-arch-room-runtime' '-rewrite=^android.arch.persistence.room:testing$=android-arch-room-testing' '-rewrite=^android.arch.persistence:db$=android-arch-persistence-db' '-rewrite=^android.arch.persistence:db-framework$=android-arch-persistence-db-framework' '-rewrite=^androidx.annotation:annotation$=androidx.annotation_annotation' '-rewrite=^androidx.appcompat:appcompat$=androidx.appcompat_appcompat' '-rewrite=^androidx.arch.core:core-common$=androidx.arch.core_core-common' '-rewrite=^androidx.arch.core:core-runtime$=androidx.arch.core_core-runtime' '-rewrite=^androidx.asynclayoutinflater:asynclayoutinflater$=androidx.asynclayoutinflater_asynclayoutinflater' '-rewrite=^androidx.browser:browser$=androidx.browser_browser' '-rewrite=^androidx.car:car$=androidx.car_car' '-rewrite=^androidx.cardview:cardview$=androidx.cardview_cardview' '-rewrite=^androidx.collection:collection$=androidx.collection_collection' '-rewrite=^androidx.constraintlayout:constraintlayout$=androidx-constraintlayout_constraintlayout' '-rewrite=^androidx.constraintlayout:constraintlayout-solver$=androidx-constraintlayout_constraintlayout-solver' '-rewrite=^androidx.contentpaging:contentpaging$=androidx.contentpaging_contentpaging' '-rewrite=^androidx.coordinatorlayout:coordinatorlayout$=androidx.coordinatorlayout_coordinatorlayout' '-rewrite=^androidx.core:core$=androidx.core_core' '-rewrite=^androidx.cursoradapter:cursoradapter$=androidx.cursoradapter_cursoradapter' '-rewrite=^androidx.customview:customview$=androidx.customview_customview' '-rewrite=^androidx.documentfile:documentfile$=androidx.documentfile_documentfile' '-rewrite=^androidx.drawerlayout:drawerlayout$=androidx.drawerlayout_drawerlayout' '-rewrite=^androidx.dynamicanimation:dynamicanimation$=androidx.dynamicanimation_dynamicanimation' '-rewrite=^androidx.emoji:emoji$=androidx.emoji_emoji' '-rewrite=^androidx.emoji:emoji-appcompat$=androidx.emoji_emoji-appcompat' '-rewrite=^androidx.emoji:emoji-bundled$=androidx.emoji_emoji-bundled' '-rewrite=^androidx.exifinterface:exifinterface$=androidx.exifinterface_exifinterface' '-rewrite=^androidx.fragment:fragment$=androidx.fragment_fragment' '-rewrite=^androidx.gridlayout:gridlayout$=androidx.gridlayout_gridlayout' '-rewrite=^androidx.heifwriter:heifwriter$=androidx.heifwriter_heifwriter' '-rewrite=^androidx.interpolator:interpolator$=androidx.interpolator_interpolator' '-rewrite=^androidx.leanback:leanback$=androidx.leanback_leanback' '-rewrite=^androidx.leanback:leanback-preference$=androidx.leanback_leanback-preference' '-rewrite=^androidx.legacy:legacy-preference-v14$=androidx.legacy_legacy-preference-v14' '-rewrite=^androidx.legacy:legacy-support-core-ui$=androidx.legacy_legacy-support-core-ui' '-rewrite=^androidx.legacy:legacy-support-core-utils$=androidx.legacy_legacy-support-core-utils' '-rewrite=^androidx.legacy:legacy-support-v13$=androidx.legacy_legacy-support-v13' '-rewrite=^androidx.legacy:legacy-support-v4$=androidx.legacy_legacy-support-v4' '-rewrite=^androidx.lifecycle:lifecycle-common$=androidx.lifecycle_lifecycle-common' '-rewrite=^androidx.lifecycle:lifecycle-common-java8$=androidx.lifecycle_lifecycle-common-java8' '-rewrite=^androidx.lifecycle:lifecycle-extensions$=androidx.lifecycle_lifecycle-extensions' '-rewrite=^androidx.lifecycle:lifecycle-livedata$=androidx.lifecycle_lifecycle-livedata' '-rewrite=^androidx.lifecycle:lifecycle-livedata-core$=androidx.lifecycle_lifecycle-livedata-core' '-rewrite=^androidx.lifecycle:lifecycle-process$=androidx.lifecycle_lifecycle-process' '-rewrite=^androidx.lifecycle:lifecycle-runtime$=androidx.lifecycle_lifecycle-runtime' '-rewrite=^androidx.lifecycle:lifecycle-service$=androidx.lifecycle_lifecycle-service' '-rewrite=^androidx.lifecycle:lifecycle-viewmodel$=androidx.lifecycle_lifecycle-viewmodel' '-rewrite=^androidx.loader:loader$=androidx.loader_loader' '-rewrite=^androidx.localbroadcastmanager:localbroadcastmanager$=androidx.localbroadcastmanager_localbroadcastmanager' '-rewrite=^androidx.media:media$=androidx.media_media' '-rewrite=^androidx.mediarouter:mediarouter$=androidx.mediarouter_mediarouter' '-rewrite=^androidx.multidex:multidex$=androidx-multidex_multidex' '-rewrite=^androidx.multidex:multidex-instrumentation$=androidx-multidex_multidex-instrumentation' '-rewrite=^androidx.paging:paging-common$=androidx.paging_paging-common' '-rewrite=^androidx.paging:paging-runtime$=androidx.paging_paging-runtime' '-rewrite=^androidx.palette:palette$=androidx.palette_palette' '-rewrite=^androidx.percentlayout:percentlayout$=androidx.percentlayout_percentlayout' '-rewrite=^androidx.preference:preference$=androidx.preference_preference' '-rewrite=^androidx.print:print$=androidx.print_print' '-rewrite=^androidx.recommendation:recommendation$=androidx.recommendation_recommendation' '-rewrite=^androidx.recyclerview:recyclerview$=androidx.recyclerview_recyclerview' '-rewrite=^androidx.recyclerview:recyclerview-selection$=androidx.recyclerview_recyclerview-selection' '-rewrite=^androidx.room:room-common$=androidx.room_room-common' '-rewrite=^androidx.room:room-migration$=androidx.room_room-migration' '-rewrite=^androidx.room:room-runtime$=androidx.room_room-runtime' '-rewrite=^androidx.room:room-testing$=androidx.room_room-testing' '-rewrite=^androidx.slice:slice-builders$=androidx.slice_slice-builders' '-rewrite=^androidx.slice:slice-core$=androidx.slice_slice-core' '-rewrite=^androidx.slice:slice-view$=androidx.slice_slice-view' '-rewrite=^androidx.slidingpanelayout:slidingpanelayout$=androidx.slidingpanelayout_slidingpanelayout' '-rewrite=^androidx.sqlite:sqlite$=androidx.sqlite_sqlite' '-rewrite=^androidx.sqlite:sqlite-framework$=androidx.sqlite_sqlite-framework' '-rewrite=^androidx.swiperefreshlayout:swiperefreshlayout$=androidx.swiperefreshlayout_swiperefreshlayout' '-rewrite=^androidx.textclassifier:textclassifier$=androidx.textclassifier_textclassifier' '-rewrite=^androidx.transition:transition$=androidx.transition_transition' '-rewrite=^androidx.tvprovider:tvprovider$=androidx.tvprovider_tvprovider' '-rewrite=^androidx.vectordrawable:vectordrawable$=androidx.vectordrawable_vectordrawable' '-rewrite=^androidx.vectordrawable:vectordrawable-animated$=androidx.vectordrawable_vectordrawable-animated' '-rewrite=^androidx.versionedparcelable:versionedparcelable$=androidx.versionedparcelable_versionedparcelable' '-rewrite=^androidx.viewpager:viewpager$=androidx.viewpager_viewpager' '-rewrite=^androidx.wear:wear$=androidx.wear_wear' '-rewrite=^androidx.webkit:webkit$=androidx.webkit_webkit' '-rewrite=^com.android.support.constraint:constraint-layout$=android-support-constraint-layout' '-rewrite=^com.android.support.constraint:constraint-layout-solver$=android-support-constraint-layout-solver' '-rewrite=^com.android.support:animated-vector-drawable$=android-support-animatedvectordrawable' '-rewrite=^com.android.support:appcompat-v7$=android-support-v7-appcompat' '-rewrite=^com.android.support:asynclayoutinflater$=android-support-asynclayoutinflater' '-rewrite=^com.android.support:car$=android-support-car' '-rewrite=^com.android.support:cardview-v7$=android-support-v7-cardview' '-rewrite=^com.android.support:collections$=android-support-collections' '-rewrite=^com.android.support:contentpaging$=android-support-contentpaging' '-rewrite=^com.android.support:coordinatorlayout$=android-support-coordinatorlayout' '-rewrite=^com.android.support:cursoradapter$=android-support-cursoradapter' '-rewrite=^com.android.support:customtabs$=android-support-customtabs' '-rewrite=^com.android.support:customview$=android-support-customview' '-rewrite=^com.android.support:design$=android-support-design' '-rewrite=^com.android.support:design-animation$=android-support-design-animation' '-rewrite=^com.android.support:design-bottomappbar$=android-support-design-bottomappbar' '-rewrite=^com.android.support:design-bottomnavigation$=android-support-design-bottomnavigation' '-rewrite=^com.android.support:design-bottomsheet$=android-support-design-bottomsheet' '-rewrite=^com.android.support:design-button$=android-support-design-button' '-rewrite=^com.android.support:design-canvas$=android-support-design-canvas' '-rewrite=^com.android.support:design-card$=android-support-design-card' '-rewrite=^com.android.support:design-chip$=android-support-design-chip' '-rewrite=^com.android.support:design-circularreveal$=android-support-design-circularreveal' '-rewrite=^com.android.support:design-circularreveal-cardview$=android-support-design-circularreveal-cardview' '-rewrite=^com.android.support:design-circularreveal-coordinatorlayout$=android-support-design-circularreveal-coordinatorlayout' '-rewrite=^com.android.support:design-color$=android-support-design-color' '-rewrite=^com.android.support:design-dialog$=android-support-design-dialog' '-rewrite=^com.android.support:design-drawable$=android-support-design-drawable' '-rewrite=^com.android.support:design-expandable$=android-support-design-expandable' '-rewrite=^com.android.support:design-floatingactionbutton$=android-support-design-floatingactionbutton' '-rewrite=^com.android.support:design-internal$=android-support-design-internal' '-rewrite=^com.android.support:design-math$=android-support-design-math' '-rewrite=^com.android.support:design-navigation$=android-support-design-navigation' '-rewrite=^com.android.support:design-resources$=android-support-design-resources' '-rewrite=^com.android.support:design-ripple$=android-support-design-ripple' '-rewrite=^com.android.support:design-shape$=android-support-design-shape' '-rewrite=^com.android.support:design-snackbar$=android-support-design-snackbar' '-rewrite=^com.android.support:design-stateful$=android-support-design-stateful' '-rewrite=^com.android.support:design-tabs$=android-support-design-tabs' '-rewrite=^com.android.support:design-textfield$=android-support-design-textfield' '-rewrite=^com.android.support:design-theme$=android-support-design-theme' '-rewrite=^com.android.support:design-transformation$=android-support-design-transformation' '-rewrite=^com.android.support:design-typography$=android-support-design-typography' '-rewrite=^com.android.support:design-widget$=android-support-design-widget' '-rewrite=^com.android.support:documentfile$=android-support-documentfile' '-rewrite=^com.android.support:drawerlayout$=android-support-drawerlayout' '-rewrite=^com.android.support:exifinterface$=android-support-exifinterface' '-rewrite=^com.android.support:gridlayout-v7$=android-support-v7-gridlayout' '-rewrite=^com.android.support:heifwriter$=android-support-heifwriter' '-rewrite=^com.android.support:interpolator$=android-support-interpolator' '-rewrite=^com.android.support:leanback-v17$=android-support-v17-leanback' '-rewrite=^com.android.support:loader$=android-support-loader' '-rewrite=^com.android.support:localbroadcastmanager$=android-support-localbroadcastmanager' '-rewrite=^com.android.support:mediarouter-v7$=android-support-v7-mediarouter' '-rewrite=^com.android.support:multidex$=android-support-multidex' '-rewrite=^com.android.support:multidex-instrumentation$=android-support-multidex-instrumentation' '-rewrite=^com.android.support:palette-v7$=android-support-v7-palette' '-rewrite=^com.android.support:percent$=android-support-percent' '-rewrite=^com.android.support:preference-leanback-v17$=android-support-v17-preference-leanback' '-rewrite=^com.android.support:preference-v14$=android-support-v14-preference' '-rewrite=^com.android.support:preference-v7$=android-support-v7-preference' '-rewrite=^com.android.support:print$=android-support-print' '-rewrite=^com.android.support:recommendation$=android-support-recommendation' '-rewrite=^com.android.support:recyclerview-selection$=android-support-recyclerview-selection' '-rewrite=^com.android.support:recyclerview-v7$=android-support-v7-recyclerview' '-rewrite=^com.android.support:slices-builders$=android-slices-builders' '-rewrite=^com.android.support:slices-core$=android-slices-core' '-rewrite=^com.android.support:slices-view$=android-slices-view' '-rewrite=^com.android.support:slidingpanelayout$=android-support-slidingpanelayout' '-rewrite=^com.android.support:support-annotations$=android-support-annotations' '-rewrite=^com.android.support:support-compat$=android-support-compat' '-rewrite=^com.android.support:support-content$=android-support-support-content' '-rewrite=^com.android.support:support-core-ui$=android-support-core-ui' '-rewrite=^com.android.support:support-core-utils$=android-support-core-utils' '-rewrite=^com.android.support:support-dynamic-animation$=android-support-dynamic-animation' '-rewrite=^com.android.support:support-emoji$=android-support-emoji' '-rewrite=^com.android.support:support-emoji-appcompat$=android-support-emoji-appcompat' '-rewrite=^com.android.support:support-emoji-bundled$=android-support-emoji-bundled' '-rewrite=^com.android.support:support-fragment$=android-support-fragment' '-rewrite=^com.android.support:support-media-compat$=android-support-media-compat' '-rewrite=^com.android.support:support-tv-provider$=android-support-tv-provider' '-rewrite=^com.android.support:support-v13$=android-support-v13' '-rewrite=^com.android.support:support-v4$=android-support-v4' '-rewrite=^com.android.support:support-vector-drawable$=android-support-vectordrawable' '-rewrite=^com.android.support:swiperefreshlayout$=android-support-swiperefreshlayout' '-rewrite=^com.android.support:textclassifier$=android-support-textclassifier' '-rewrite=^com.android.support:transition$=android-support-transition' '-rewrite=^com.android.support:versionedparcelable$=android-versionedparcelable' '-rewrite=^com.android.support:viewpager$=android-support-viewpager' '-rewrite=^com.android.support:wear$=android-support-wear' '-rewrite=^com.android.support:webkit$=android-support-webkit' '-rewrite=^com.android.temp.support:design$=androidx.design_design' '-rewrite=^com.android.temp.support:design-animation$=androidx.design_design-animation' '-rewrite=^com.android.temp.support:design-bottomappbar$=androidx.design_design-bottomappbar' '-rewrite=^com.android.temp.support:design-bottomnavigation$=androidx.design_design-bottomnavigation' '-rewrite=^com.android.temp.support:design-bottomsheet$=androidx.design_design-bottomsheet' '-rewrite=^com.android.temp.support:design-button$=androidx.design_design-button' '-rewrite=^com.android.temp.support:design-canvas$=androidx.design_design-canvas' '-rewrite=^com.android.temp.support:design-card$=androidx.design_design-card' '-rewrite=^com.android.temp.support:design-chip$=androidx.design_design-chip' '-rewrite=^com.android.temp.support:design-circularreveal$=androidx.design_design-circularreveal' '-rewrite=^com.android.temp.support:design-circularreveal-cardview$=androidx.design_design-circularreveal-cardview' '-rewrite=^com.android.temp.support:design-circularreveal-coordinatorlayout$=androidx.design_design-circularreveal-coordinatorlayout' '-rewrite=^com.android.temp.support:design-color$=androidx.design_design-color' '-rewrite=^com.android.temp.support:design-dialog$=androidx.design_design-dialog' '-rewrite=^com.android.temp.support:design-drawable$=androidx.design_design-drawable' '-rewrite=^com.android.temp.support:design-expandable$=androidx.design_design-expandable' '-rewrite=^com.android.temp.support:design-floatingactionbutton$=androidx.design_design-floatingactionbutton' '-rewrite=^com.android.temp.support:design-internal$=androidx.design_design-internal' '-rewrite=^com.android.temp.support:design-math$=androidx.design_design-math' '-rewrite=^com.android.temp.support:design-navigation$=androidx.design_design-navigation' '-rewrite=^com.android.temp.support:design-resources$=androidx.design_design-resources' '-rewrite=^com.android.temp.support:design-ripple$=androidx.design_design-ripple' '-rewrite=^com.android.temp.support:design-shape$=androidx.design_design-shape' '-rewrite=^com.android.temp.support:design-snackbar$=androidx.design_design-snackbar' '-rewrite=^com.android.temp.support:design-stateful$=androidx.design_design-stateful' '-rewrite=^com.android.temp.support:design-tabs$=androidx.design_design-tabs' '-rewrite=^com.android.temp.support:design-textfield$=androidx.design_design-textfield' '-rewrite=^com.android.temp.support:design-theme$=androidx.design_design-theme' '-rewrite=^com.android.temp.support:design-transformation$=androidx.design_design-transformation' '-rewrite=^com.android.temp.support:design-typography$=androidx.design_design-typography' '-rewrite=^com.android.temp.support:design-widget$=androidx.design_design-widget' '-rewrite=^com.google.android.material:material$=com.google.android.material_material' '-rewrite=^com.google.android:flexbox$=flexbox' -extra-deps=android-support-car=prebuilt-android.car-stubs -exclude=androidx.room_room-migration -exclude=androidx.room_room-testing -exclude=android-arch-room-migration -exclude=android-arch-room-testing .

android-support-animatedvectordrawable-nodeps = android_library_import {
    name = "android-support-animatedvectordrawable-nodeps";
    aars = ["m2repository/com/android/support/animated-vector-drawable/28.0.0/animated-vector-drawable-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-vectordrawable"
        "android-support-core-ui"
    ];
};

android-support-animatedvectordrawable = android_library {
    name = "android-support-animatedvectordrawable";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-animatedvectordrawable/AndroidManifest.xml";
    static_libs = [
        "android-support-animatedvectordrawable-nodeps"
        "android-support-vectordrawable"
        "android-support-core-ui"
    ];
    java_version = "1.7";
};

android-support-v7-appcompat-nodeps = android_library_import {
    name = "android-support-v7-appcompat-nodeps";
    aars = ["m2repository/com/android/support/appcompat-v7/28.0.0/appcompat-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-cursoradapter"
        "android-support-core-utils"
        "android-support-fragment"
        "android-support-vectordrawable"
        "android-support-animatedvectordrawable"
    ];
};

android-support-v7-appcompat = android_library {
    name = "android-support-v7-appcompat";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-appcompat/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-appcompat-nodeps"
        "android-support-annotations"
        "android-support-collections"
        "android-support-compat"
        "android-support-cursoradapter"
        "android-support-core-utils"
        "android-support-fragment"
        "android-support-vectordrawable"
        "android-support-animatedvectordrawable"
    ];
    java_version = "1.7";
};

android-support-asynclayoutinflater-nodeps = android_library_import {
    name = "android-support-asynclayoutinflater-nodeps";
    aars = ["m2repository/com/android/support/asynclayoutinflater/28.0.0/asynclayoutinflater-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-asynclayoutinflater = android_library {
    name = "android-support-asynclayoutinflater";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-asynclayoutinflater/AndroidManifest.xml";
    static_libs = [
        "android-support-asynclayoutinflater-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-car-nodeps = android_library_import {
    name = "android-support-car-nodeps";
    aars = ["m2repository/com/android/support/car/28.0.0-alpha5/car-28.0.0-alpha5.aar"];
    sdk_version = "current";
    min_sdk_version = "24";
    static_libs = [
        "android-support-design"
        "android-support-v7-appcompat"
        "android-support-v7-cardview"
        "android-support-v4"
        "android-support-v7-recyclerview"
        "android-support-v7-gridlayout"
        "android-support-v7-preference"
        "android-support-constraint-layout"
        "prebuilt-android.car-stubs"
    ];
};

android-support-car = android_library {
    name = "android-support-car";
    sdk_version = "current";
    min_sdk_version = "24";
    manifest = "manifests/android-support-car/AndroidManifest.xml";
    static_libs = [
        "android-support-car-nodeps"
        "android-support-annotations"
        "android-support-design"
        "android-support-v7-appcompat"
        "android-support-v7-cardview"
        "android-support-v4"
        "android-support-v7-recyclerview"
        "android-support-v7-gridlayout"
        "android-support-v7-preference"
        "android-support-constraint-layout"
        "prebuilt-android.car-stubs"
    ];
    java_version = "1.7";
};

android-support-v7-cardview-nodeps = android_library_import {
    name = "android-support-v7-cardview-nodeps";
    aars = ["m2repository/com/android/support/cardview-v7/28.0.0/cardview-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-v7-cardview = android_library {
    name = "android-support-v7-cardview";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-cardview/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-cardview-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-collections-nodeps = java_import {
    name = "android-support-collections-nodeps";
    jars = ["m2repository/com/android/support/collections/28.0.0/collections-28.0.0.jar"];
    sdk_version = "current";
};

android-support-collections = java_library_static {
    name = "android-support-collections";
    sdk_version = "current";
    static_libs = [
        "android-support-collections-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-coordinatorlayout-nodeps = android_library_import {
    name = "android-support-coordinatorlayout-nodeps";
    aars = ["m2repository/com/android/support/coordinatorlayout/28.0.0/coordinatorlayout-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-customview"
    ];
};

android-support-coordinatorlayout = android_library {
    name = "android-support-coordinatorlayout";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-coordinatorlayout/AndroidManifest.xml";
    static_libs = [
        "android-support-coordinatorlayout-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-customview"
    ];
    java_version = "1.7";
};

android-support-cursoradapter-nodeps = android_library_import {
    name = "android-support-cursoradapter-nodeps";
    aars = ["m2repository/com/android/support/cursoradapter/28.0.0/cursoradapter-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-cursoradapter = android_library {
    name = "android-support-cursoradapter";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-cursoradapter/AndroidManifest.xml";
    static_libs = [
        "android-support-cursoradapter-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-customtabs-nodeps = android_library_import {
    name = "android-support-customtabs-nodeps";
    aars = ["m2repository/com/android/support/customtabs/28.0.0/customtabs-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "15";
    static_libs = [
        "android-support-compat"
        "android-support-interpolator"
        "android-support-core-ui"
    ];
};

android-support-customtabs = android_library {
    name = "android-support-customtabs";
    sdk_version = "current";
    min_sdk_version = "15";
    manifest = "manifests/android-support-customtabs/AndroidManifest.xml";
    static_libs = [
        "android-support-customtabs-nodeps"
        "android-support-annotations"
        "android-support-collections"
        "android-support-compat"
        "android-support-interpolator"
        "android-support-core-ui"
    ];
    java_version = "1.7";
};

android-support-customview-nodeps = android_library_import {
    name = "android-support-customview-nodeps";
    aars = ["m2repository/com/android/support/customview/28.0.0/customview-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-customview = android_library {
    name = "android-support-customview";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-customview/AndroidManifest.xml";
    static_libs = [
        "android-support-customview-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-documentfile-nodeps = android_library_import {
    name = "android-support-documentfile-nodeps";
    aars = ["m2repository/com/android/support/documentfile/28.0.0/documentfile-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-documentfile = android_library {
    name = "android-support-documentfile";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-documentfile/AndroidManifest.xml";
    static_libs = [
        "android-support-documentfile-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-drawerlayout-nodeps = android_library_import {
    name = "android-support-drawerlayout-nodeps";
    aars = ["m2repository/com/android/support/drawerlayout/28.0.0/drawerlayout-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-customview"
    ];
};

android-support-drawerlayout = android_library {
    name = "android-support-drawerlayout";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-drawerlayout/AndroidManifest.xml";
    static_libs = [
        "android-support-drawerlayout-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-customview"
    ];
    java_version = "1.7";
};

android-support-exifinterface-nodeps = android_library_import {
    name = "android-support-exifinterface-nodeps";
    aars = ["m2repository/com/android/support/exifinterface/28.0.0/exifinterface-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-exifinterface = android_library {
    name = "android-support-exifinterface";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-exifinterface/AndroidManifest.xml";
    static_libs = [
        "android-support-exifinterface-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-v7-gridlayout-nodeps = android_library_import {
    name = "android-support-v7-gridlayout-nodeps";
    aars = ["m2repository/com/android/support/gridlayout-v7/28.0.0/gridlayout-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-core-ui"
    ];
};

android-support-v7-gridlayout = android_library {
    name = "android-support-v7-gridlayout";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-gridlayout/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-gridlayout-nodeps"
        "android-support-compat"
        "android-support-core-ui"
    ];
    java_version = "1.7";
};

android-support-heifwriter-nodeps = android_library_import {
    name = "android-support-heifwriter-nodeps";
    aars = ["m2repository/com/android/support/heifwriter/28.0.0/heifwriter-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "28";
    static_libs = [
    ];
};

android-support-heifwriter = android_library {
    name = "android-support-heifwriter";
    sdk_version = "current";
    min_sdk_version = "28";
    manifest = "manifests/android-support-heifwriter/AndroidManifest.xml";
    static_libs = [
        "android-support-heifwriter-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-interpolator-nodeps = android_library_import {
    name = "android-support-interpolator-nodeps";
    aars = ["m2repository/com/android/support/interpolator/28.0.0/interpolator-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-interpolator = android_library {
    name = "android-support-interpolator";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-interpolator/AndroidManifest.xml";
    static_libs = [
        "android-support-interpolator-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-v17-leanback-nodeps = android_library_import {
    name = "android-support-v17-leanback-nodeps";
    aars = ["m2repository/com/android/support/leanback-v17/28.0.0/leanback-v17-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "17";
    static_libs = [
        "android-support-compat"
        "android-support-core-ui"
        "android-support-media-compat"
        "android-support-fragment"
        "android-support-v7-recyclerview"
    ];
};

android-support-v17-leanback = android_library {
    name = "android-support-v17-leanback";
    sdk_version = "current";
    min_sdk_version = "17";
    manifest = "manifests/android-support-v17-leanback/AndroidManifest.xml";
    static_libs = [
        "android-support-v17-leanback-nodeps"
        "android-support-compat"
        "android-support-core-ui"
        "android-support-media-compat"
        "android-support-fragment"
        "android-support-v7-recyclerview"
    ];
    java_version = "1.7";
};

android-support-loader-nodeps = android_library_import {
    name = "android-support-loader-nodeps";
    aars = ["m2repository/com/android/support/loader/28.0.0/loader-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-arch-lifecycle-livedata-core"
        "android-arch-lifecycle-viewmodel"
    ];
};

android-support-loader = android_library {
    name = "android-support-loader";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-loader/AndroidManifest.xml";
    static_libs = [
        "android-support-loader-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-arch-lifecycle-livedata-core"
        "android-arch-lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

android-support-localbroadcastmanager-nodeps = android_library_import {
    name = "android-support-localbroadcastmanager-nodeps";
    aars = ["m2repository/com/android/support/localbroadcastmanager/28.0.0/localbroadcastmanager-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-localbroadcastmanager = android_library {
    name = "android-support-localbroadcastmanager";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-localbroadcastmanager/AndroidManifest.xml";
    static_libs = [
        "android-support-localbroadcastmanager-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-v7-mediarouter-nodeps = android_library_import {
    name = "android-support-v7-mediarouter-nodeps";
    aars = ["m2repository/com/android/support/mediarouter-v7/28.0.0/mediarouter-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-media-compat"
        "android-support-v7-appcompat"
        "android-support-v7-palette"
    ];
};

android-support-v7-mediarouter = android_library {
    name = "android-support-v7-mediarouter";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-mediarouter/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-mediarouter-nodeps"
        "android-support-media-compat"
        "android-support-v7-appcompat"
        "android-support-v7-palette"
    ];
    java_version = "1.7";
};

android-support-v7-palette-nodeps = android_library_import {
    name = "android-support-v7-palette-nodeps";
    aars = ["m2repository/com/android/support/palette-v7/28.0.0/palette-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-core-utils"
    ];
};

android-support-v7-palette = android_library {
    name = "android-support-v7-palette";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-palette/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-palette-nodeps"
        "android-support-compat"
        "android-support-core-utils"
    ];
    java_version = "1.7";
};

android-support-percent-nodeps = android_library_import {
    name = "android-support-percent-nodeps";
    aars = ["m2repository/com/android/support/percent/28.0.0/percent-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-percent = android_library {
    name = "android-support-percent";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-percent/AndroidManifest.xml";
    static_libs = [
        "android-support-percent-nodeps"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-v17-preference-leanback-nodeps = android_library_import {
    name = "android-support-v17-preference-leanback-nodeps";
    aars = ["m2repository/com/android/support/preference-leanback-v17/28.0.0/preference-leanback-v17-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "17";
    static_libs = [
        "android-support-v7-appcompat"
        "android-support-v7-recyclerview"
        "android-support-v7-preference"
        "android-support-v14-preference"
        "android-support-v17-leanback"
    ];
};

android-support-v17-preference-leanback = android_library {
    name = "android-support-v17-preference-leanback";
    sdk_version = "current";
    min_sdk_version = "17";
    manifest = "manifests/android-support-v17-preference-leanback/AndroidManifest.xml";
    static_libs = [
        "android-support-v17-preference-leanback-nodeps"
        "android-support-collections"
        "android-support-v7-appcompat"
        "android-support-v7-recyclerview"
        "android-support-v7-preference"
        "android-support-v14-preference"
        "android-support-v17-leanback"
    ];
    java_version = "1.7";
};

android-support-v14-preference-nodeps = android_library_import {
    name = "android-support-v14-preference-nodeps";
    aars = ["m2repository/com/android/support/preference-v14/28.0.0/preference-v14-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-v7-preference"
    ];
};

android-support-v14-preference = android_library {
    name = "android-support-v14-preference";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v14-preference/AndroidManifest.xml";
    static_libs = [
        "android-support-v14-preference-nodeps"
        "android-support-v7-preference"
    ];
    java_version = "1.7";
};

android-support-v7-preference-nodeps = android_library_import {
    name = "android-support-v7-preference-nodeps";
    aars = ["m2repository/com/android/support/preference-v7/28.0.0/preference-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-fragment"
        "android-support-v7-appcompat"
        "android-support-v7-recyclerview"
    ];
};

android-support-v7-preference = android_library {
    name = "android-support-v7-preference";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-preference/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-preference-nodeps"
        "android-support-collections"
        "android-support-compat"
        "android-support-fragment"
        "android-support-v7-appcompat"
        "android-support-v7-recyclerview"
    ];
    java_version = "1.7";
};

android-support-print-nodeps = android_library_import {
    name = "android-support-print-nodeps";
    aars = ["m2repository/com/android/support/print/28.0.0/print-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-support-print = android_library {
    name = "android-support-print";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-print/AndroidManifest.xml";
    static_libs = [
        "android-support-print-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-recommendation-nodeps = android_library_import {
    name = "android-support-recommendation-nodeps";
    aars = ["m2repository/com/android/support/recommendation/28.0.0/recommendation-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "21";
    static_libs = [
    ];
};

android-support-recommendation = android_library {
    name = "android-support-recommendation";
    sdk_version = "current";
    min_sdk_version = "21";
    manifest = "manifests/android-support-recommendation/AndroidManifest.xml";
    static_libs = [
        "android-support-recommendation-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-recyclerview-selection-nodeps = android_library_import {
    name = "android-support-recyclerview-selection-nodeps";
    aars = ["m2repository/com/android/support/recyclerview-selection/28.0.0/recyclerview-selection-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-v7-recyclerview"
        "android-support-compat"
    ];
};

android-support-recyclerview-selection = android_library {
    name = "android-support-recyclerview-selection";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-recyclerview-selection/AndroidManifest.xml";
    static_libs = [
        "android-support-recyclerview-selection-nodeps"
        "android-support-annotations"
        "android-support-v7-recyclerview"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-v7-recyclerview-nodeps = android_library_import {
    name = "android-support-v7-recyclerview-nodeps";
    aars = ["m2repository/com/android/support/recyclerview-v7/28.0.0/recyclerview-v7-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-core-ui"
    ];
};

android-support-v7-recyclerview = android_library {
    name = "android-support-v7-recyclerview";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v7-recyclerview/AndroidManifest.xml";
    static_libs = [
        "android-support-v7-recyclerview-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-core-ui"
    ];
    java_version = "1.7";
};

android-slices-builders-nodeps = android_library_import {
    name = "android-slices-builders-nodeps";
    aars = ["m2repository/com/android/support/slices-builders/28.0.0/slices-builders-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "19";
    static_libs = [
        "android-slices-core"
        "android-support-compat"
    ];
};

android-slices-builders = android_library {
    name = "android-slices-builders";
    sdk_version = "current";
    min_sdk_version = "19";
    manifest = "manifests/android-slices-builders/AndroidManifest.xml";
    static_libs = [
        "android-slices-builders-nodeps"
        "android-support-annotations"
        "android-slices-core"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-slices-core-nodeps = android_library_import {
    name = "android-slices-core-nodeps";
    aars = ["m2repository/com/android/support/slices-core/28.0.0/slices-core-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "19";
    static_libs = [
        "android-support-v7-appcompat"
    ];
};

android-slices-core = android_library {
    name = "android-slices-core";
    sdk_version = "current";
    min_sdk_version = "19";
    manifest = "manifests/android-slices-core/AndroidManifest.xml";
    static_libs = [
        "android-slices-core-nodeps"
        "android-support-annotations"
        "android-support-v7-appcompat"
    ];
    java_version = "1.7";
};

android-slices-view-nodeps = android_library_import {
    name = "android-slices-view-nodeps";
    aars = ["m2repository/com/android/support/slices-view/28.0.0/slices-view-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "19";
    static_libs = [
        "android-arch-lifecycle-livedata-core"
        "android-slices-core"
        "android-support-v7-recyclerview"
    ];
};

android-slices-view = android_library {
    name = "android-slices-view";
    sdk_version = "current";
    min_sdk_version = "19";
    manifest = "manifests/android-slices-view/AndroidManifest.xml";
    static_libs = [
        "android-slices-view-nodeps"
        "android-arch-lifecycle-livedata-core"
        "android-slices-core"
        "android-support-v7-recyclerview"
    ];
    java_version = "1.7";
};

android-support-slidingpanelayout-nodeps = android_library_import {
    name = "android-support-slidingpanelayout-nodeps";
    aars = ["m2repository/com/android/support/slidingpanelayout/28.0.0/slidingpanelayout-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-customview"
    ];
};

android-support-slidingpanelayout = android_library {
    name = "android-support-slidingpanelayout";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-slidingpanelayout/AndroidManifest.xml";
    static_libs = [
        "android-support-slidingpanelayout-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-customview"
    ];
    java_version = "1.7";
};

android-support-annotations-nodeps = java_import {
    name = "android-support-annotations-nodeps";
    jars = ["m2repository/com/android/support/support-annotations/28.0.0/support-annotations-28.0.0.jar"];
    sdk_version = "current";
};

android-support-annotations = java_library_static {
    name = "android-support-annotations";
    sdk_version = "current";
    static_libs = [
        "android-support-annotations-nodeps"
    ];
    java_version = "1.7";
};

android-support-compat-nodeps = android_library_import {
    name = "android-support-compat-nodeps";
    aars = ["m2repository/com/android/support/support-compat/28.0.0/support-compat-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-arch-lifecycle-runtime"
        "android-versionedparcelable"
    ];
};

android-support-compat = android_library {
    name = "android-support-compat";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-compat/AndroidManifest.xml";
    static_libs = [
        "android-support-compat-nodeps"
        "android-support-annotations"
        "android-support-collections"
        "android-arch-lifecycle-runtime"
        "android-versionedparcelable"
    ];
    java_version = "1.7";
};

android-support-core-ui-nodeps = android_library_import {
    name = "android-support-core-ui-nodeps";
    aars = ["m2repository/com/android/support/support-core-ui/28.0.0/support-core-ui-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-core-utils"
        "android-support-customview"
        "android-support-viewpager"
        "android-support-coordinatorlayout"
        "android-support-drawerlayout"
        "android-support-slidingpanelayout"
        "android-support-interpolator"
        "android-support-swiperefreshlayout"
        "android-support-asynclayoutinflater"
        "android-support-cursoradapter"
    ];
};

android-support-core-ui = android_library {
    name = "android-support-core-ui";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-core-ui/AndroidManifest.xml";
    static_libs = [
        "android-support-core-ui-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-core-utils"
        "android-support-customview"
        "android-support-viewpager"
        "android-support-coordinatorlayout"
        "android-support-drawerlayout"
        "android-support-slidingpanelayout"
        "android-support-interpolator"
        "android-support-swiperefreshlayout"
        "android-support-asynclayoutinflater"
        "android-support-cursoradapter"
    ];
    java_version = "1.7";
};

android-support-core-utils-nodeps = android_library_import {
    name = "android-support-core-utils-nodeps";
    aars = ["m2repository/com/android/support/support-core-utils/28.0.0/support-core-utils-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-documentfile"
        "android-support-loader"
        "android-support-localbroadcastmanager"
        "android-support-print"
    ];
};

android-support-core-utils = android_library {
    name = "android-support-core-utils";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-core-utils/AndroidManifest.xml";
    static_libs = [
        "android-support-core-utils-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-documentfile"
        "android-support-loader"
        "android-support-localbroadcastmanager"
        "android-support-print"
    ];
    java_version = "1.7";
};

android-support-dynamic-animation-nodeps = android_library_import {
    name = "android-support-dynamic-animation-nodeps";
    aars = ["m2repository/com/android/support/support-dynamic-animation/28.0.0/support-dynamic-animation-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-core-utils"
    ];
};

android-support-dynamic-animation = android_library {
    name = "android-support-dynamic-animation";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-dynamic-animation/AndroidManifest.xml";
    static_libs = [
        "android-support-dynamic-animation-nodeps"
        "android-support-collections"
        "android-support-compat"
        "android-support-core-utils"
    ];
    java_version = "1.7";
};

android-support-emoji-appcompat-nodeps = android_library_import {
    name = "android-support-emoji-appcompat-nodeps";
    aars = ["m2repository/com/android/support/support-emoji-appcompat/28.0.0/support-emoji-appcompat-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-emoji"
        "android-support-v7-appcompat"
    ];
};

android-support-emoji-appcompat = android_library {
    name = "android-support-emoji-appcompat";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-emoji-appcompat/AndroidManifest.xml";
    static_libs = [
        "android-support-emoji-appcompat-nodeps"
        "android-support-emoji"
        "android-support-v7-appcompat"
    ];
    java_version = "1.7";
};

android-support-emoji-bundled-nodeps = android_library_import {
    name = "android-support-emoji-bundled-nodeps";
    aars = ["m2repository/com/android/support/support-emoji-bundled/28.0.0/support-emoji-bundled-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-emoji"
    ];
};

android-support-emoji-bundled = android_library {
    name = "android-support-emoji-bundled";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-emoji-bundled/AndroidManifest.xml";
    static_libs = [
        "android-support-emoji-bundled-nodeps"
        "android-support-emoji"
    ];
    java_version = "1.7";
};

android-support-emoji-nodeps = android_library_import {
    name = "android-support-emoji-nodeps";
    aars = ["m2repository/com/android/support/support-emoji/28.0.0/support-emoji-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-emoji = android_library {
    name = "android-support-emoji";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-emoji/AndroidManifest.xml";
    static_libs = [
        "android-support-emoji-nodeps"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-fragment-nodeps = android_library_import {
    name = "android-support-fragment-nodeps";
    aars = ["m2repository/com/android/support/support-fragment/28.0.0/support-fragment-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-core-ui"
        "android-support-core-utils"
        "android-support-loader"
        "android-arch-lifecycle-viewmodel"
    ];
};

android-support-fragment = android_library {
    name = "android-support-fragment";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-fragment/AndroidManifest.xml";
    static_libs = [
        "android-support-fragment-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-core-ui"
        "android-support-core-utils"
        "android-support-loader"
        "android-arch-lifecycle-viewmodel"
    ];
    java_version = "1.7";
};

android-support-media-compat-nodeps = android_library_import {
    name = "android-support-media-compat-nodeps";
    aars = ["m2repository/com/android/support/support-media-compat/28.0.0/support-media-compat-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-media-compat = android_library {
    name = "android-support-media-compat";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-media-compat/AndroidManifest.xml";
    static_libs = [
        "android-support-media-compat-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-tv-provider-nodeps = android_library_import {
    name = "android-support-tv-provider-nodeps";
    aars = ["m2repository/com/android/support/support-tv-provider/28.0.0/support-tv-provider-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "21";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-tv-provider = android_library {
    name = "android-support-tv-provider";
    sdk_version = "current";
    min_sdk_version = "21";
    manifest = "manifests/android-support-tv-provider/AndroidManifest.xml";
    static_libs = [
        "android-support-tv-provider-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-v13-nodeps = android_library_import {
    name = "android-support-v13-nodeps";
    aars = ["m2repository/com/android/support/support-v13/28.0.0/support-v13-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-v4"
    ];
};

android-support-v13 = android_library {
    name = "android-support-v13";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v13/AndroidManifest.xml";
    static_libs = [
        "android-support-v13-nodeps"
        "android-support-v4"
    ];
    java_version = "1.7";
};

android-support-v4-nodeps = android_library_import {
    name = "android-support-v4-nodeps";
    aars = ["m2repository/com/android/support/support-v4/28.0.0/support-v4-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-media-compat"
        "android-support-core-utils"
        "android-support-core-ui"
        "android-support-fragment"
    ];
};

android-support-v4 = android_library {
    name = "android-support-v4";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-v4/AndroidManifest.xml";
    static_libs = [
        "android-support-v4-nodeps"
        "android-support-compat"
        "android-support-media-compat"
        "android-support-core-utils"
        "android-support-core-ui"
        "android-support-fragment"
    ];
    java_version = "1.7";
};

android-support-vectordrawable-nodeps = android_library_import {
    name = "android-support-vectordrawable-nodeps";
    aars = ["m2repository/com/android/support/support-vector-drawable/28.0.0/support-vector-drawable-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-vectordrawable = android_library {
    name = "android-support-vectordrawable";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-vectordrawable/AndroidManifest.xml";
    static_libs = [
        "android-support-vectordrawable-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-support-swiperefreshlayout-nodeps = android_library_import {
    name = "android-support-swiperefreshlayout-nodeps";
    aars = ["m2repository/com/android/support/swiperefreshlayout/28.0.0/swiperefreshlayout-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-interpolator"
    ];
};

android-support-swiperefreshlayout = android_library {
    name = "android-support-swiperefreshlayout";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-swiperefreshlayout/AndroidManifest.xml";
    static_libs = [
        "android-support-swiperefreshlayout-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-interpolator"
    ];
    java_version = "1.7";
};

android-support-transition-nodeps = android_library_import {
    name = "android-support-transition-nodeps";
    aars = ["m2repository/com/android/support/transition/28.0.0/transition-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-transition = android_library {
    name = "android-support-transition";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-transition/AndroidManifest.xml";
    static_libs = [
        "android-support-transition-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

android-versionedparcelable-nodeps = android_library_import {
    name = "android-versionedparcelable-nodeps";
    aars = ["m2repository/com/android/support/versionedparcelable/28.0.0/versionedparcelable-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
    ];
};

android-versionedparcelable = android_library {
    name = "android-versionedparcelable";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-versionedparcelable/AndroidManifest.xml";
    static_libs = [
        "android-versionedparcelable-nodeps"
        "android-support-annotations"
    ];
    java_version = "1.7";
};

android-support-viewpager-nodeps = android_library_import {
    name = "android-support-viewpager-nodeps";
    aars = ["m2repository/com/android/support/viewpager/28.0.0/viewpager-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
        "android-support-customview"
    ];
};

android-support-viewpager = android_library {
    name = "android-support-viewpager";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-viewpager/AndroidManifest.xml";
    static_libs = [
        "android-support-viewpager-nodeps"
        "android-support-annotations"
        "android-support-compat"
        "android-support-customview"
    ];
    java_version = "1.7";
};

android-support-wear-nodeps = android_library_import {
    name = "android-support-wear-nodeps";
    aars = ["m2repository/com/android/support/wear/28.0.0/wear-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "23";
    static_libs = [
        "android-support-core-ui"
        "android-support-fragment"
        "android-support-v7-recyclerview"
        "android-support-constraint-layout"
    ];
};

android-support-wear = android_library {
    name = "android-support-wear";
    sdk_version = "current";
    min_sdk_version = "23";
    manifest = "manifests/android-support-wear/AndroidManifest.xml";
    static_libs = [
        "android-support-wear-nodeps"
        "android-support-annotations"
        "android-support-core-ui"
        "android-support-fragment"
        "android-support-v7-recyclerview"
        "android-support-constraint-layout"
    ];
    java_version = "1.7";
};

android-support-webkit-nodeps = android_library_import {
    name = "android-support-webkit-nodeps";
    aars = ["m2repository/com/android/support/webkit/28.0.0/webkit-28.0.0.aar"];
    sdk_version = "current";
    min_sdk_version = "14";
    static_libs = [
        "android-support-compat"
    ];
};

android-support-webkit = android_library {
    name = "android-support-webkit";
    sdk_version = "current";
    min_sdk_version = "14";
    manifest = "manifests/android-support-webkit/AndroidManifest.xml";
    static_libs = [
        "android-support-webkit-nodeps"
        "android-support-annotations"
        "android-support-compat"
    ];
    java_version = "1.7";
};

in { inherit android-slices-builders android-slices-builders-nodeps android-slices-core android-slices-core-nodeps android-slices-view android-slices-view-nodeps android-support-animatedvectordrawable android-support-animatedvectordrawable-nodeps android-support-annotations android-support-annotations-nodeps android-support-asynclayoutinflater android-support-asynclayoutinflater-nodeps android-support-car android-support-car-nodeps android-support-collections android-support-collections-nodeps android-support-compat android-support-compat-nodeps android-support-coordinatorlayout android-support-coordinatorlayout-nodeps android-support-core-ui android-support-core-ui-nodeps android-support-core-utils android-support-core-utils-nodeps android-support-cursoradapter android-support-cursoradapter-nodeps android-support-customtabs android-support-customtabs-nodeps android-support-customview android-support-customview-nodeps android-support-documentfile android-support-documentfile-nodeps android-support-drawerlayout android-support-drawerlayout-nodeps android-support-dynamic-animation android-support-dynamic-animation-nodeps android-support-emoji android-support-emoji-appcompat android-support-emoji-appcompat-nodeps android-support-emoji-bundled android-support-emoji-bundled-nodeps android-support-emoji-nodeps android-support-exifinterface android-support-exifinterface-nodeps android-support-fragment android-support-fragment-nodeps android-support-heifwriter android-support-heifwriter-nodeps android-support-interpolator android-support-interpolator-nodeps android-support-loader android-support-loader-nodeps android-support-localbroadcastmanager android-support-localbroadcastmanager-nodeps android-support-media-compat android-support-media-compat-nodeps android-support-percent android-support-percent-nodeps android-support-print android-support-print-nodeps android-support-recommendation android-support-recommendation-nodeps android-support-recyclerview-selection android-support-recyclerview-selection-nodeps android-support-slidingpanelayout android-support-slidingpanelayout-nodeps android-support-swiperefreshlayout android-support-swiperefreshlayout-nodeps android-support-transition android-support-transition-nodeps android-support-tv-provider android-support-tv-provider-nodeps android-support-v13 android-support-v13-nodeps android-support-v14-preference android-support-v14-preference-nodeps android-support-v17-leanback android-support-v17-leanback-nodeps android-support-v17-preference-leanback android-support-v17-preference-leanback-nodeps android-support-v4 android-support-v4-nodeps android-support-v7-appcompat android-support-v7-appcompat-nodeps android-support-v7-cardview android-support-v7-cardview-nodeps android-support-v7-gridlayout android-support-v7-gridlayout-nodeps android-support-v7-mediarouter android-support-v7-mediarouter-nodeps android-support-v7-palette android-support-v7-palette-nodeps android-support-v7-preference android-support-v7-preference-nodeps android-support-v7-recyclerview android-support-v7-recyclerview-nodeps android-support-vectordrawable android-support-vectordrawable-nodeps android-support-viewpager android-support-viewpager-nodeps android-support-wear android-support-wear-nodeps android-support-webkit android-support-webkit-nodeps android-versionedparcelable android-versionedparcelable-nodeps; }

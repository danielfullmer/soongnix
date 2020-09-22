{ android_test }:
let

UiBench = android_test {
    name = "UiBench";
    sdk_version = "current";
    min_sdk_version = "21";
    #  omit gradle 'build' dir
    srcs = [
        "src/com/android/test/uibench/ActivityTransition.java"
        "src/com/android/test/uibench/ActivityTransitionDetails.java"
        "src/com/android/test/uibench/BitmapUploadActivity.java"
        "src/com/android/test/uibench/ClippedListActivity.java"
        "src/com/android/test/uibench/DialogListActivity.java"
        "src/com/android/test/uibench/EditTextTypeActivity.java"
        "src/com/android/test/uibench/FadingEdgeListActivity.java"
        "src/com/android/test/uibench/FullscreenOverdrawActivity.java"
        "src/com/android/test/uibench/GlTextureViewActivity.java"
        "src/com/android/test/uibench/InflatingListActivity.java"
        "src/com/android/test/uibench/InvalidateActivity.java"
        "src/com/android/test/uibench/InvalidateTreeActivity.java"
        "src/com/android/test/uibench/MainActivity.java"
        "src/com/android/test/uibench/NavigationDrawerActivity.java"
        "src/com/android/test/uibench/NotificationShadeActivity.java"
        "src/com/android/test/uibench/RenderingJitter.java"
        "src/com/android/test/uibench/ResizeHWLayerActivity.java"
        "src/com/android/test/uibench/SaveLayerInterleaveActivity.java"
        "src/com/android/test/uibench/ScrollableWebViewActivity.java"
        "src/com/android/test/uibench/ShadowGridActivity.java"
        "src/com/android/test/uibench/SlowBindRecyclerViewActivity.java"
        "src/com/android/test/uibench/SlowNestedRecyclerViewActivity.java"
        "src/com/android/test/uibench/TextCacheHighHitrateActivity.java"
        "src/com/android/test/uibench/TextCacheLowHitrateActivity.java"
        "src/com/android/test/uibench/TextUtils.java"
        "src/com/android/test/uibench/TrivialAnimationActivity.java"
        "src/com/android/test/uibench/TrivialAnimationActivityWideGamut.java"
        "src/com/android/test/uibench/TrivialListActivity.java"
        "src/com/android/test/uibench/TrivialRecyclerViewActivity.java"
        "src/com/android/test/uibench/WindowInsetsControllerActivity.java"
        "src/com/android/test/uibench/leanback/BitmapLoader.java"
        "src/com/android/test/uibench/leanback/BrowseActivity.java"
        "src/com/android/test/uibench/leanback/BrowseFragment.java"
        "src/com/android/test/uibench/leanback/CardPresenter.java"
        "src/com/android/test/uibench/leanback/PhotoItem.java"
        "src/com/android/test/uibench/leanback/TestHelper.java"
        "src/com/android/test/uibench/listview/CompatListActivity.java"
        "src/com/android/test/uibench/listview/FadingEdgeListFragment.java"
        "src/com/android/test/uibench/opengl/ImageFlipRenderThread.java"
        "src/com/android/test/uibench/recyclerview/RvArrayAdapter.java"
        "src/com/android/test/uibench/recyclerview/RvBoxAdapter.java"
        "src/com/android/test/uibench/recyclerview/RvCompatListActivity.java"
    ];
    #  use appcompat/support lib from the tree, so improvements/
    #  regressions are reflected in test data
    resource_dirs = ["res"];
    static_libs = [
        "com.google.android.material_material"
        "androidx.legacy_legacy-support-v4"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.leanback_leanback"
    ];
    test_suites = ["device-tests"];
};

in { inherit UiBench; }

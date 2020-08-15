{ android_test }:
let

JankBench = android_test {
    name = "JankBench";
    manifest = "app/src/main/AndroidManifest.xml";
    sdk_version = "current";
    #  omit gradle 'build' dir
    srcs = [
        "app/src/main/java/com/android/benchmark/app/BenchmarkDashboardFragment.java"
        "app/src/main/java/com/android/benchmark/app/BenchmarkListAdapter.java"
        "app/src/main/java/com/android/benchmark/app/HomeActivity.java"
        "app/src/main/java/com/android/benchmark/app/PerfTimeline.java"
        "app/src/main/java/com/android/benchmark/app/RunLocalBenchmarksActivity.java"
        "app/src/main/java/com/android/benchmark/app/UiResultsFragment.java"
        "app/src/main/java/com/android/benchmark/registry/BenchmarkCategory.java"
        "app/src/main/java/com/android/benchmark/registry/BenchmarkGroup.java"
        "app/src/main/java/com/android/benchmark/registry/BenchmarkRegistry.java"
        "app/src/main/java/com/android/benchmark/results/GlobalResultsStore.java"
        "app/src/main/java/com/android/benchmark/results/UiBenchmarkResult.java"
        "app/src/main/java/com/android/benchmark/synthetic/MemoryActivity.java"
        "app/src/main/java/com/android/benchmark/synthetic/TestInterface.java"
        "app/src/main/java/com/android/benchmark/ui/BitmapUploadActivity.java"
        "app/src/main/java/com/android/benchmark/ui/EditTextInputActivity.java"
        "app/src/main/java/com/android/benchmark/ui/FullScreenOverdrawActivity.java"
        "app/src/main/java/com/android/benchmark/ui/ImageListViewScrollActivity.java"
        "app/src/main/java/com/android/benchmark/ui/ListActivityBase.java"
        "app/src/main/java/com/android/benchmark/ui/ListViewScrollActivity.java"
        "app/src/main/java/com/android/benchmark/ui/ShadowGridActivity.java"
        "app/src/main/java/com/android/benchmark/ui/TextScrollActivity.java"
        "app/src/main/java/com/android/benchmark/ui/Utils.java"
        "app/src/main/java/com/android/benchmark/ui/automation/Automator.java"
        "app/src/main/java/com/android/benchmark/ui/automation/CollectorThread.java"
        "app/src/main/java/com/android/benchmark/ui/automation/FrameTimingStats.java"
        "app/src/main/java/com/android/benchmark/ui/automation/Interaction.java"
    ];
    #  use appcompat/support lib from the tree, so improvements/
    #  regressions are reflected in test data
    resource_dirs = ["app/src/main/res"];
    static_libs = [
        "com.google.android.material_material"
        "androidx.legacy_legacy-support-v4"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.leanback_leanback"
        "apache-commons-math"
        "junit"
    ];
    test_suites = ["device-tests"];
};

in { inherit JankBench; }

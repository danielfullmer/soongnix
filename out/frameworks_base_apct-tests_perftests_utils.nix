{ java_library }:
let

apct-perftests-utils = java_library {
    name = "apct-perftests-utils";
    static_libs = [
        "androidx.test.rules"
        "androidx.annotation_annotation"
    ];
    #  Build all java files in the java subdirectory
    srcs = [
        "src/android/perftests/utils/BenchmarkState.java"
        "src/android/perftests/utils/BitmapUtils.java"
        "src/android/perftests/utils/LayoutUtils.java"
        "src/android/perftests/utils/ManualBenchmarkState.java"
        "src/android/perftests/utils/OneTimeSettingsListener.java"
        "src/android/perftests/utils/PerfManualStatusReporter.java"
        "src/android/perftests/utils/PerfStatusReporter.java"
        "src/android/perftests/utils/SettingsHelper.java"
        "src/android/perftests/utils/SettingsStateKeeperRule.java"
        "src/android/perftests/utils/SettingsStateManager.java"
        "src/android/perftests/utils/ShellHelper.java"
        "src/android/perftests/utils/StateKeeperRule.java"
        "src/android/perftests/utils/StateManager.java"
        "src/android/perftests/utils/Stats.java"
        "src/android/perftests/utils/StubActivity.java"
    ];
};

in { inherit apct-perftests-utils; }

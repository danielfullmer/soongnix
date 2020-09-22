{ android_test }:
let

MediaProviderClientTests = android_test {
    name = "MediaProviderClientTests";
    test_suites = [
        "device-tests"
        "mts"
    ];
    compile_multilib = "both";

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/providers/media/client/ClientPlaylistTest.java"
        "src/com/android/providers/media/client/DelegatorTest.java"
        "src/com/android/providers/media/client/LegacyProviderMigrationTest.java"
        "src/com/android/providers/media/client/PerformanceTest.java"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.test.rules"
        "collector-device-lib-platform"
        "mockito-target"
        "truth-prebuilt"
    ];

    certificate = "media";
};

in { inherit MediaProviderClientTests; }

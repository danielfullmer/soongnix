{ android_test }:
let

MediaProviderTests = android_test {
    name = "MediaProviderTests";
    test_suites = ["device-tests"];

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/providers/media/DatabaseHelperTest.java"
        "src/com/android/providers/media/IdleServiceTest.java"
        "src/com/android/providers/media/IsoInterfaceTest.java"
        "src/com/android/providers/media/MediaProviderTest.java"
        "src/com/android/providers/media/XmpInterfaceTest.java"
        "src/com/android/providers/media/scan/MediaScannerTest.java"
        "src/com/android/providers/media/scan/ModernMediaScannerTest.java"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.test.rules"
        "mockito-target"
    ];

    certificate = "media";

    instrumentation_for = "MediaProvider";
};

in { inherit MediaProviderTests; }

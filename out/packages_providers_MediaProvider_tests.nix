{ android_test }:
let

MediaProviderTests = android_test {
    name = "MediaProviderTests";
    test_suites = ["device-tests"];

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/**/*.java"
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

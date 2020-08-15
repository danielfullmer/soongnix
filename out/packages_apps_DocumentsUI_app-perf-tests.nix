{ android_test }:
let

DocumentsUIAppPerfTests = android_test {
    name = "DocumentsUIAppPerfTests";

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/documentsui/FilesAppPerfTest.java"
        "src/com/android/documentsui/LauncherActivity.java"
    ];

    libs = [
        "android.test.base"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "mockito-target"
        "ub-uiautomator"
    ];

    platform_apis = true;

    instrumentation_for = "DocumentsUI";

    certificate = "platform";

    test_suites = ["device-tests"];

    # sdk_version: "current",
};

in { inherit DocumentsUIAppPerfTests; }

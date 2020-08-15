{ android_test }:
let

DocumentsUIPerfTests = android_test {
    name = "DocumentsUIPerfTests";

    manifest = "AndroidManifest.xml";

    srcs = [
        ":DocumentsUIPerfTests-files"
        "src/com/android/documentsui/FilesActivityPerfTest.java"
        "src/com/android/documentsui/FilesJankPerfTest.java"
        "src/com/android/documentsui/StressProvider.java"
    ];

    resource_dirs = [
        "res"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "mockito-target"
        "ub-janktesthelper"
        "ub-uiautomator"
    ];

    platform_apis = true;

    instrumentation_for = "DocumentsUI";

    certificate = "platform";
};

in { inherit DocumentsUIPerfTests; }

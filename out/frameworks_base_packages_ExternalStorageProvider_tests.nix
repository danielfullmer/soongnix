{ android_test }:
let

ExternalStorageProviderTests = android_test {
    name = "ExternalStorageProviderTests";

    manifest = "AndroidManifest.xml";

    srcs = [
        "src/com/android/externalstorage/ExternalStorageProviderTest.java"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.test.rules"
        "mockito-target"
        "truth-prebuilt"
    ];

    certificate = "platform";

    instrumentation_for = "ExternalStorageProvider";
};

in { inherit ExternalStorageProviderTests; }

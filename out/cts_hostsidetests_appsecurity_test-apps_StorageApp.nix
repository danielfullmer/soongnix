{ android_test_helper_app, java_library }:
let

CtsStorageAppLib = java_library {
    name = "CtsStorageAppLib";
    srcs = [
        "src/com/android/cts/storageapp/Hoarder.java"
        "src/com/android/cts/storageapp/StorageTest.java"
        "src/com/android/cts/storageapp/Utils.java"
        "src/com/android/cts/storageapp/UtilsActivity.java"
        "src/com/android/cts/storageapp/UtilsProvider.java"
        "src/com/android/cts/storageapp/UtilsReceiver.java"
    ];
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    libs = [
        "android.test.base.stubs"
        "ub-uiautomator"
    ];
};

CtsStorageAppA = android_test_helper_app {
    name = "CtsStorageAppA";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "androidx.test.rules"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/com/android/cts/storageapp/Hoarder.java"
        "src/com/android/cts/storageapp/StorageTest.java"
        "src/com/android/cts/storageapp/Utils.java"
        "src/com/android/cts/storageapp/UtilsActivity.java"
        "src/com/android/cts/storageapp/UtilsProvider.java"
        "src/com/android/cts/storageapp/UtilsReceiver.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "AndroidManifestA.xml";
};

CtsStorageAppB = android_test_helper_app {
    name = "CtsStorageAppB";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "androidx.test.rules"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/com/android/cts/storageapp/Hoarder.java"
        "src/com/android/cts/storageapp/StorageTest.java"
        "src/com/android/cts/storageapp/Utils.java"
        "src/com/android/cts/storageapp/UtilsActivity.java"
        "src/com/android/cts/storageapp/UtilsProvider.java"
        "src/com/android/cts/storageapp/UtilsReceiver.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "AndroidManifestB.xml";
};

in { inherit CtsStorageAppA CtsStorageAppB CtsStorageAppLib; }

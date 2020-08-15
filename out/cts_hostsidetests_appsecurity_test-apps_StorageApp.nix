{ java_library }:
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

in { inherit CtsStorageAppLib; }

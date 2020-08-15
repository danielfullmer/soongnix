{ android_test }:
let

HierarchyViewerTest = android_test {
    name = "HierarchyViewerTest";
    srcs = [
        "src/com/android/test/hierarchyviewer/Decoder.java"
        "src/com/android/test/hierarchyviewer/MainActivity.java"
        "src/com/android/test/hierarchyviewer/MainActivityTest.java"
        "src/com/android/test/hierarchyviewer/ViewDumpParser.java"
    ];
    sdk_version = "current";
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = ["junit"];
};

in { inherit HierarchyViewerTest; }

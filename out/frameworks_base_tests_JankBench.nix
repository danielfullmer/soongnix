{ android_test }:
let

JankBench = android_test {
    name = "JankBench";
    manifest = "app/src/main/AndroidManifest.xml";
    sdk_version = "current";
    #  omit gradle 'build' dir
    srcs = ["app/src/main/java/**/*.java"];
    #  use appcompat/support lib from the tree, so improvements/
    #  regressions are reflected in test data
    resource_dirs = ["app/src/main/res"];
    static_libs = [
        "com.google.android.material_material"
        "androidx.legacy_legacy-support-v4"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.leanback_leanback"
        "apache-commons-math"
        "junit"
    ];
    test_suites = ["device-tests"];
};

in { inherit JankBench; }

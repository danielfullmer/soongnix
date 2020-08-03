{ android_test }:
let

UiBench = android_test {
    name = "UiBench";
    sdk_version = "current";
    min_sdk_version = "21";
    #  omit gradle 'build' dir
    srcs = ["src/**/*.java"];
    #  use appcompat/support lib from the tree, so improvements/
    #  regressions are reflected in test data
    resource_dirs = ["res"];
    static_libs = [
        "com.google.android.material_material"
        "androidx.legacy_legacy-support-v4"
        "androidx.appcompat_appcompat"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.leanback_leanback"
    ];
    test_suites = ["device-tests"];
};

in { inherit UiBench; }

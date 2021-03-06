{ android_test_helper_app, java_genrule }:
let

FrameworksCoreTests_install_bad_dex_ = android_test_helper_app {
    name = "FrameworksCoreTests_install_bad_dex_";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["src/com/android/frameworks/coretests/TestActivity.java"];
};

#  Inject bad classes.dex file.
FrameworksCoreTests_install_bad_dex = java_genrule {
    name = "FrameworksCoreTests_install_bad_dex";
    tools = [
        "soong_zip"
        "merge_zips"
    ];
    srcs = [
        ":FrameworksCoreTests_install_bad_dex_"
        "classes.dex"
    ];
    out = ["FrameworksCoreTests_install_bad_dex.apk"];
    cmd = "$(location soong_zip) -o $(genDir)/classes.dex.zip -j -f $(location classes.dex) && " +
        "$(location merge_zips) -ignore-duplicates $(out) $(genDir)/classes.dex.zip " +
        "$(location :FrameworksCoreTests_install_bad_dex_)";
};

in { inherit FrameworksCoreTests_install_bad_dex FrameworksCoreTests_install_bad_dex_; }

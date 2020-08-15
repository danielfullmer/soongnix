{ android_test_helper_app }:
let

FrameworksCoreTests_install_split_base = android_test_helper_app {
    name = "FrameworksCoreTests_install_split_base";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["src/com/google/android/dexapis/splitapp/BaseActivity.java"];
};

in { inherit FrameworksCoreTests_install_split_base; }

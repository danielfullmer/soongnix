{ android_test_helper_app }:
let

FrameworksServicesTests_install_split_base = android_test_helper_app {
    name = "FrameworksServicesTests_install_split_base";
    defaults = ["FrameworksServicesTests_apks_defaults"];

    srcs = ["src/com/google/android/dexapis/splitapp/BaseActivity.java"];
};

in { inherit FrameworksServicesTests_install_split_base; }

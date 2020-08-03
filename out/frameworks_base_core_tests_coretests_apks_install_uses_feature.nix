{ android_test_helper_app }:
let

FrameworksCoreTests_install_uses_feature = android_test_helper_app {
    name = "FrameworksCoreTests_install_uses_feature";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_install_uses_feature; }

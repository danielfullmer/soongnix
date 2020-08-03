{ android_test_helper_app }:
let

FrameworksCoreTests_install_split_base = android_test_helper_app {
    name = "FrameworksCoreTests_install_split_base";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_install_split_base; }

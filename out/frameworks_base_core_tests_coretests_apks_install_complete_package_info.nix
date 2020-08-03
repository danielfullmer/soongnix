{ android_test_helper_app }:
let

FrameworksCoreTests_install_complete_package_info = android_test_helper_app {
    name = "FrameworksCoreTests_install_complete_package_info";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_install_complete_package_info; }

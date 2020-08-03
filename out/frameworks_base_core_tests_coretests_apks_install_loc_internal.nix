{ android_test_helper_app }:
let

FrameworksCoreTests_install_loc_internal = android_test_helper_app {
    name = "FrameworksCoreTests_install_loc_internal";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_install_loc_internal; }

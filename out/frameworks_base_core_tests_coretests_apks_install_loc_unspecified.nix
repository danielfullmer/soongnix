{ android_test_helper_app }:
let

FrameworksCoreTests_install_loc_unspecified = android_test_helper_app {
    name = "FrameworksCoreTests_install_loc_unspecified";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [];
};

in { inherit FrameworksCoreTests_install_loc_unspecified; }

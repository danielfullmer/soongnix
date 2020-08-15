{ android_test_helper_app }:
let

FrameworksCoreTests_install_use_perm_good = android_test_helper_app {
    name = "FrameworksCoreTests_install_use_perm_good";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [];
};

in { inherit FrameworksCoreTests_install_use_perm_good; }

{ android_test_helper_app }:
let

FrameworksCoreTests_install_verifier_bad = android_test_helper_app {
    name = "FrameworksCoreTests_install_verifier_bad";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [];
};

in { inherit FrameworksCoreTests_install_verifier_bad; }

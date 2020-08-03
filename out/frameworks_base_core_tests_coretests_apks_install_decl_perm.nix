{ android_test_helper_app }:
let

FrameworksCoreTests_install_decl_perm = android_test_helper_app {
    name = "FrameworksCoreTests_install_decl_perm";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_install_decl_perm; }

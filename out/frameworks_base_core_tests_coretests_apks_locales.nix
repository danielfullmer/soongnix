{ android_test_helper_app }:
let

FrameworksCoreTests_locales = android_test_helper_app {
    name = "FrameworksCoreTests_locales";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];
};

in { inherit FrameworksCoreTests_locales; }

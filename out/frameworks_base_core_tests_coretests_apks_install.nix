{ android_test_helper_app }:
let

FrameworksCoreTests_install = android_test_helper_app {
    name = "FrameworksCoreTests_install";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [];
};

in { inherit FrameworksCoreTests_install; }

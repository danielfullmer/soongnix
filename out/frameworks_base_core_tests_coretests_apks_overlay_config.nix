{ android_test_helper_app }:
let

FrameworksCoreTests_overlay_config = android_test_helper_app {
    name = "FrameworksCoreTests_overlay_config";
    defaults = ["FrameworksCoreTests_apks_defaults"];
};

in { inherit FrameworksCoreTests_overlay_config; }

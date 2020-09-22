{ android_test_helper_app }:
let

FrameworksServicesTests_install_intent_filters = android_test_helper_app {
    name = "FrameworksServicesTests_install_intent_filters";
    defaults = ["FrameworksServicesTests_apks_defaults"];

    srcs = ["src/com/android/frameworks/servicestests/TestActivity.java"];
};

in { inherit FrameworksServicesTests_install_intent_filters; }

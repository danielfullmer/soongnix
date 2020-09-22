{ android_test_helper_app }:
let

FrameworksServicesTests_install_split_feature_a = android_test_helper_app {
    name = "FrameworksServicesTests_install_split_feature_a";
    defaults = ["FrameworksServicesTests_apks_defaults"];

    srcs = ["src/com/google/android/dexapis/splitapp/feature_a/FeatureAActivity.java"];

    aaptflags = [
        "--custom-package com.google.android.dexapis.splitapp.feature_a"
        "--package-id 0x80"
    ];
};

in { inherit FrameworksServicesTests_install_split_feature_a; }

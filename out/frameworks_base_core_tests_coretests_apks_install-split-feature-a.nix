{ android_test_helper_app }:
let

FrameworksCoreTests_install_split_feature_a = android_test_helper_app {
    name = "FrameworksCoreTests_install_split_feature_a";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = ["**/*.java"];

    aaptflags = [
        "--custom-package com.google.android.dexapis.splitapp.feature_a"
        "--package-id 0x80"
    ];
};

in { inherit FrameworksCoreTests_install_split_feature_a; }

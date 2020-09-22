{ android_app }:
let

SimAppDialog = android_app {
    name = "SimAppDialog";

    srcs = ["src/com/android/simappdialog/InstallCarrierAppActivity.java"];

    platform_apis = true;
    certificate = "platform";

    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "setup-wizard-lib"
    ];

    resource_dirs = ["res"];
};

in { inherit SimAppDialog; }

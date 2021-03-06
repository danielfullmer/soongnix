{ android_test_helper_app }:
let

FrameworksCoreTests_version_1_nosys = android_test_helper_app {
    name = "FrameworksCoreTests_version_1_nosys";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = ["src/com/android/frameworks/coretests/version_test/NullProvider.java"];
    aaptflags = [
        "--version-code 1"
        "--version-name 1.0"
    ];
    certificate = ":FrameworksCoreTests_unit_test_cert";
};

in { inherit FrameworksCoreTests_version_1_nosys; }

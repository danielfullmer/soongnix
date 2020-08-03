{ android_test_helper_app }:
let

FrameworksCoreTests_version_1 = android_test_helper_app {
    name = "FrameworksCoreTests_version_1";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = ["**/*.java"];
    aaptflags = [
        "--version-code 1"
        "--version-name 1.0"
    ];
    certificate = ":FrameworksCoreTests_unit_test_cert";
};

FrameworksCoreTests_version_2 = android_test_helper_app {
    name = "FrameworksCoreTests_version_2";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = ["**/*.java"];
    aaptflags = [
        "--version-code 2"
        "--version-name 2.0"
    ];
    certificate = ":FrameworksCoreTests_unit_test_cert";
};

FrameworksCoreTests_version_3 = android_test_helper_app {
    name = "FrameworksCoreTests_version_3";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = ["**/*.java"];
    aaptflags = [
        "--version-code 3"
        "--version-name 3.0"
    ];
    certificate = ":FrameworksCoreTests_unit_test_cert";
};

FrameworksCoreTests_version_1_diff = android_test_helper_app {
    name = "FrameworksCoreTests_version_1_diff";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = ["**/*.java"];
    aaptflags = [
        "--version-code 1"
        "--version-name 1.0"
    ];
    certificate = ":FrameworksCoreTests_unit_test_cert";
};

FrameworksCoreTests_version_2_diff = android_test_helper_app {
    name = "FrameworksCoreTests_version_2_diff";
    defaults = ["FrameworksCoreTests_apks_defaults"];
    srcs = ["**/*.java"];
    aaptflags = [
        "--version-code 2"
        "--version-name 2.0"
    ];
    certificate = ":FrameworksCoreTests_unit_test_cert";
};

in { inherit FrameworksCoreTests_version_1 FrameworksCoreTests_version_1_diff FrameworksCoreTests_version_2 FrameworksCoreTests_version_2_diff FrameworksCoreTests_version_3; }

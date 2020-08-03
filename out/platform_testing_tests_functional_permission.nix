{ android_test }:
let

PermissionFunctionalTests = android_test {
    name = "PermissionFunctionalTests";

    sdk_version = "test_current";

    srcs = ["**/*.java"];
    static_libs = [
        "ub-uiautomator"
        "launcher-helper-lib"
        "permission-helper"
        "package-helper"
        "junit"
    ];

    libs = ["android.test.base.stubs"];

    certificate = "platform";

    test_suites = ["device-tests"];
};

in { inherit PermissionFunctionalTests; }

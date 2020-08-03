{ android_test_helper_app }:
let

EnabledTestApp = android_test_helper_app {
    name = "EnabledTestApp";

    srcs = ["**/*.java"];

    sdk_version = "current";
    certificate = "platform";
};

in { inherit EnabledTestApp; }

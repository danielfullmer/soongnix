{ android_test_helper_app }:
let

DisabledTestApp = android_test_helper_app {
    name = "DisabledTestApp";

    srcs = ["**/*.java"];

    sdk_version = "current";
    certificate = "platform";
};

in { inherit DisabledTestApp; }

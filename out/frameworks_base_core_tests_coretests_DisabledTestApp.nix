{ android_test_helper_app }:
let

DisabledTestApp = android_test_helper_app {
    name = "DisabledTestApp";

    srcs = ["src/com/android/frameworks/coretests/disabled_app/EnabledActivity.java"];

    sdk_version = "current";
    certificate = "platform";
};

in { inherit DisabledTestApp; }

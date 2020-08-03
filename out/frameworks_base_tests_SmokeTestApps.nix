{ android_test }:
let

SmokeTestTriggerApps = android_test {
    name = "SmokeTestTriggerApps";
    srcs = ["src/**/*.java"];
    sdk_version = "current";
};

in { inherit SmokeTestTriggerApps; }

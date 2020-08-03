{ android_test }:
let

DemoModeController = android_test {
    name = "DemoModeController";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit DemoModeController; }

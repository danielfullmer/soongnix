{ android_test }:
let

BatteryWaster = android_test {
    name = "BatteryWaster";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit BatteryWaster; }

{ android_test }:
let

BatteryWaster = android_test {
    name = "BatteryWaster";
    srcs = ["src/com/android/batterywaster/BatteryWaster.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit BatteryWaster; }

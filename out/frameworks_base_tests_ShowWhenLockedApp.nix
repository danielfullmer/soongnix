{ android_test }:
let

ShowWhenLocked = android_test {
    name = "ShowWhenLocked";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit ShowWhenLocked; }

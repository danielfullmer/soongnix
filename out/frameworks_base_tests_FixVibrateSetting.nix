{ android_app }:
let

FixVibrateSetting = android_app {
    name = "FixVibrateSetting";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit FixVibrateSetting; }

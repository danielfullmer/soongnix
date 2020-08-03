{ android_app }:
let

SafetyRegulatoryInfo = android_app {
    name = "SafetyRegulatoryInfo";
    srcs = ["**/*.java"];
    optimize = {
        enabled = false;
    };
    sdk_version = "current";
};

in { inherit SafetyRegulatoryInfo; }

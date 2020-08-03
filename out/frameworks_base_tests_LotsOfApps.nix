{ android_app }:
let

LotsOfApps = android_app {
    name = "LotsOfApps";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
    optimize = {
        enabled = false;
    };
};

in { inherit LotsOfApps; }

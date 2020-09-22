{ android_app }:
let

DevelopmentSettings = android_app {
    name = "DevelopmentSettings";
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit DevelopmentSettings; }

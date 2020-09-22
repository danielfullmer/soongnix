{ android_app }:
let

MultiResolution = android_app {
    name = "MultiResolution";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/multires/MultiRes.java"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit MultiResolution; }

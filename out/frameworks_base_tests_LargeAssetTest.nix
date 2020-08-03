{ android_app }:
let

LargeAssetTest = android_app {
    name = "LargeAssetTest";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit LargeAssetTest; }

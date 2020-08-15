{ android_app }:
let

LargeAssetTest = android_app {
    name = "LargeAssetTest";
    srcs = ["src/com/android/largeassettest/LargeAssetTest.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit LargeAssetTest; }

{ android_test }:
let

LightingTest = android_test {
    name = "LightingTest";
    srcs = ["src/com/android/lightingtest/ClearActivity.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit LightingTest; }

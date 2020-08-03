{ android_test }:
let

EffectsTest = android_test {
    name = "EffectsTest";
    srcs = ["**/*.java"];
    platform_apis = true;
};

in { inherit EffectsTest; }

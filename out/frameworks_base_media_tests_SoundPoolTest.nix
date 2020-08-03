{ android_test }:
let

SoundPoolTest = android_test {
    name = "SoundPoolTest";
    srcs = ["**/*.java"];
    platform_apis = true;
};

in { inherit SoundPoolTest; }

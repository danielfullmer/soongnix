{ android_test }:
let

SoundPoolTest = android_test {
    name = "SoundPoolTest";
    srcs = ["src/com/android/SoundPoolTest.java"];
    platform_apis = true;
};

in { inherit SoundPoolTest; }

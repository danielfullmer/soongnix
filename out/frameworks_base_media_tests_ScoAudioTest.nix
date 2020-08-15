{ android_test }:
let

scoaudiotest = android_test {
    name = "scoaudiotest";
    platform_apis = true;
    srcs = ["src/com/android/scoaudiotest/ScoAudioTest.java"];
};

in { inherit scoaudiotest; }

{ android_test }:
let

scoaudiotest = android_test {
    name = "scoaudiotest";
    platform_apis = true;
    srcs = ["**/*.java"];
};

in { inherit scoaudiotest; }

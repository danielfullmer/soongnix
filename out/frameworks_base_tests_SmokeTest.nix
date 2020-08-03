{ android_test }:
let

SmokeTestApp = android_test {
    name = "SmokeTestApp";
    #  This builds "SmokeTestApp"
    srcs = ["src/**/*.java"];
    sdk_version = "8";
};

in { inherit SmokeTestApp; }

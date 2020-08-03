{ android_test }:
let

LocationTracker = android_test {
    name = "LocationTracker";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit LocationTracker; }

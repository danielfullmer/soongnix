{ android_app }:
let

SpareParts = android_app {
    name = "SpareParts";
    srcs = ["**/*.java"];
    platform_apis = true;
};

in { inherit SpareParts; }

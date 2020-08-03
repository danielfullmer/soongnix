{ android_test }:
let

Assist = android_test {
    name = "Assist";
    srcs = ["**/*.java"];
    platform_apis = true;
};

in { inherit Assist; }

{ android_test }:
let

ActivityTest = android_test {
    name = "ActivityTest";
    srcs = ["**/*.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit ActivityTest; }

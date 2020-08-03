{ android_test }:
let

ActivityViewTest = android_test {
    name = "ActivityViewTest";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit ActivityViewTest; }

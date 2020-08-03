{ android_app }:
let

PhotoTable = android_app {
    name = "PhotoTable";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    product_specific = true;
    sdk_version = "current";
};

in { inherit PhotoTable; }

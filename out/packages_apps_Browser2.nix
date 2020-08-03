{ android_app }:
let

Browser2 = android_app {
    name = "Browser2";
    sdk_version = "current";
    srcs = ["src/**/*.java"];
    product_specific = true;
};

in { inherit Browser2; }

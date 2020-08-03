{ android_app }:
let

DozeTest = android_app {
    name = "DozeTest";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
};

in { inherit DozeTest; }

{ android_app }:
let

BasicDreams = android_app {
    name = "BasicDreams";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
};

in { inherit BasicDreams; }

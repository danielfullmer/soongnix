{ android_app }:
let

TransitionTests = android_app {
    name = "TransitionTests";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    static_libs = ["android-common"];
    optimize = {
        enabled = false;
    };
};

in { inherit TransitionTests; }

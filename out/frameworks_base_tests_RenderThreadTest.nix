{ android_test }:
let

RenderThreadTest = android_test {
    name = "RenderThreadTest";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    static_libs = ["android-common"];
    optimize = {
        enabled = false;
    };
};

in { inherit RenderThreadTest; }

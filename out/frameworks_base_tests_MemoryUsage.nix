{ android_test }:
let

MemoryUsage = android_test {
    name = "MemoryUsage";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
};

in { inherit MemoryUsage; }

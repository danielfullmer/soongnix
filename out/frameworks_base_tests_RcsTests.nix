{ android_test }:
let

RcsTests = android_test {
    name = "RcsTests";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = [
        "junit"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];
};

in { inherit RcsTests; }

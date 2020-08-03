{ android_test }:
let

DummyPowerTest = android_test {
    name = "DummyPowerTest";
    srcs = ["src/**/*.java"];

    static_libs = [
        "PowerTestHelper-src"
        "android.test.runner.stubs"
        "ub-uiautomator"
        "android.test.base.stubs"
        "junit"
    ];
};

in { inherit DummyPowerTest; }

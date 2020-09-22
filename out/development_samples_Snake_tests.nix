{ android_test }:
let

SnakeTests = android_test {
    name = "SnakeTests";
    srcs = ["src/com/example/android/snake/SnakeTest.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = ["junit"];
    instrumentation_for = "Snake";
    sdk_version = "current";
};

in { inherit SnakeTests; }

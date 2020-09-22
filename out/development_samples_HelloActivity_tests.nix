{ android_test }:
let

HelloActivityTests = android_test {
    name = "HelloActivityTests";
    srcs = ["src/com/example/android/helloactivity/HelloActivityTest.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = ["junit"];
    instrumentation_for = "HelloActivity";
    sdk_version = "current";
};

in { inherit HelloActivityTests; }

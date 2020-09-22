{ android_test }:
let

SkeletonAppTests = android_test {
    name = "SkeletonAppTests";
    srcs = ["src/com/example/android/skeletonapp/SkeletonAppTest.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = ["junit"];
    instrumentation_for = "SkeletonApp";
    sdk_version = "current";
};

in { inherit SkeletonAppTests; }

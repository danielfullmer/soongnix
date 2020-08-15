{ android_test }:
let

TransformTest = android_test {
    name = "TransformTest";
    srcs = ["src/com/google/android/test/transform/TransformTestActivity.java"];
    sdk_version = "current";
};

in { inherit TransformTest; }

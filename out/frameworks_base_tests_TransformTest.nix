{ android_test }:
let

TransformTest = android_test {
    name = "TransformTest";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit TransformTest; }

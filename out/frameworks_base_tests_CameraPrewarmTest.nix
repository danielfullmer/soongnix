{ android_test }:
let

CameraPrewarmTest = android_test {
    name = "CameraPrewarmTest";
    srcs = ["**/*.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit CameraPrewarmTest; }

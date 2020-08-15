{ android_test }:
let

CameraPrewarmTest = android_test {
    name = "CameraPrewarmTest";
    srcs = [
        "src/com/google/android/test/cameraprewarm/CameraActivity.java"
        "src/com/google/android/test/cameraprewarm/PrewarmService.java"
        "src/com/google/android/test/cameraprewarm/SecureCameraActivity.java"
    ];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit CameraPrewarmTest; }

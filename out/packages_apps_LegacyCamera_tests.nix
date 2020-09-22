{ android_test }:
let

LegacyCameraTests = android_test {
    name = "LegacyCameraTests";

    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];

    srcs = [
        "src/com/android/camera/CameraLaunchPerformance.java"
        "src/com/android/camera/CameraStressTestRunner.java"
        "src/com/android/camera/StressTests.java"
        "src/com/android/camera/UnitTests.java"
        "src/com/android/camera/functional/CameraTest.java"
        "src/com/android/camera/functional/ImageCaptureIntentTest.java"
        "src/com/android/camera/functional/VideoCaptureIntentTest.java"
        "src/com/android/camera/power/ImageAndVideoCapture.java"
        "src/com/android/camera/stress/CameraLatency.java"
        "src/com/android/camera/stress/CameraStartUp.java"
        "src/com/android/camera/stress/ImageCapture.java"
        "src/com/android/camera/stress/SwitchPreview.java"
        "src/com/android/camera/stress/TestUtil.java"
        "src/com/android/camera/stress/VideoCapture.java"
        "src/com/android/camera/unittest/CameraTest.java"
    ];

    platform_apis = true;

    instrumentation_for = "LegacyCamera";

};

in { inherit LegacyCameraTests; }

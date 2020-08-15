{ android_test }:
let

CameraEffectsTests = android_test {
    name = "CameraEffectsTests";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    #  Include all test java files.
    srcs = ["src/android/camera/mediaeffects/tests/functional/EffectsVideoCapture.java"];
    platform_apis = true;
    instrumentation_for = "CameraEffectsRecordingSample";
};

in { inherit CameraEffectsTests; }

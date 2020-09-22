{ android_test }:
let

audiopolicytest = android_test {
    name = "audiopolicytest";
    srcs = [
        "src/com/android/audiopolicytest/AudioManagerTest.java"
        "src/com/android/audiopolicytest/AudioPolicyTest.java"
        "src/com/android/audiopolicytest/AudioProductStrategyTest.java"
        "src/com/android/audiopolicytest/AudioVolumeGroupCallbackHelper.java"
        "src/com/android/audiopolicytest/AudioVolumeGroupChangeHandlerTest.java"
        "src/com/android/audiopolicytest/AudioVolumeGroupTest.java"
        "src/com/android/audiopolicytest/AudioVolumesTestBase.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = [
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "android-ex-camera2"
        "testng"
    ];
    platform_apis = true;
    certificate = "platform";
    resource_dirs = ["res"];
};

in { inherit audiopolicytest; }

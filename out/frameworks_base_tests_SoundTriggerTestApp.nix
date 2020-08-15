{ android_app }:
let

SoundTriggerTestApp = android_app {
    name = "SoundTriggerTestApp";
    srcs = [
        "src/com/android/test/soundtrigger/SoundTriggerTestActivity.java"
        "src/com/android/test/soundtrigger/SoundTriggerTestService.java"
        "src/com/android/test/soundtrigger/SoundTriggerUtil.java"
    ];
    platform_apis = true;
    privileged = true;
    certificate = "platform";
};

in { inherit SoundTriggerTestApp; }

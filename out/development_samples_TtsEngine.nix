{ android_app }:
let

TtsEngine = android_app {
    name = "TtsEngine";
    srcs = [
        "src/com/example/android/ttsengine/CheckVoiceData.java"
        "src/com/example/android/ttsengine/GeneralSettingsFragment.java"
        "src/com/example/android/ttsengine/RobotSpeakSettings.java"
        "src/com/example/android/ttsengine/RobotSpeakTtsService.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit TtsEngine; }

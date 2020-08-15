{ android_test }:
let

VoiceInteraction = android_test {
    name = "VoiceInteraction";
    srcs = [
        "src/com/android/test/voiceinteraction/AssistProxyActivity.java"
        "src/com/android/test/voiceinteraction/AssistVisualizer.java"
        "src/com/android/test/voiceinteraction/AsyncStructure.java"
        "src/com/android/test/voiceinteraction/MainInteractionService.java"
        "src/com/android/test/voiceinteraction/MainInteractionSession.java"
        "src/com/android/test/voiceinteraction/MainInteractionSessionService.java"
        "src/com/android/test/voiceinteraction/MainRecognitionService.java"
        "src/com/android/test/voiceinteraction/SettingsActivity.java"
        "src/com/android/test/voiceinteraction/StartVoiceInteractionActivity.java"
        "src/com/android/test/voiceinteraction/TestInteractionActivity.java"
        "src/com/android/test/voiceinteraction/VoiceInteractionMain.java"
    ];
    platform_apis = true;
};

in { inherit VoiceInteraction; }

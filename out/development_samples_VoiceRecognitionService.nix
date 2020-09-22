{ android_app }:
let

VoiceRecognitionService = android_app {
    name = "VoiceRecognitionService";
    srcs = [
        "src/com/example/android/voicerecognitionservice/VoiceRecognitionService.java"
        "src/com/example/android/voicerecognitionservice/VoiceRecognitionSettings.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit VoiceRecognitionService; }

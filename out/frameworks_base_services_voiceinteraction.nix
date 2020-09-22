{ filegroup, java_library_static }:
let

"services.voiceinteraction-sources" = filegroup {
    name = "services.voiceinteraction-sources";
    srcs = [
        "java/com/android/server/soundtrigger/SoundTriggerDbHelper.java"
        "java/com/android/server/soundtrigger/SoundTriggerHelper.java"
        "java/com/android/server/soundtrigger/SoundTriggerInternal.java"
        "java/com/android/server/soundtrigger/SoundTriggerLogger.java"
        "java/com/android/server/soundtrigger/SoundTriggerService.java"
        "java/com/android/server/voiceinteraction/DatabaseHelper.java"
        "java/com/android/server/voiceinteraction/VoiceInteractionManagerService.java"
        "java/com/android/server/voiceinteraction/VoiceInteractionManagerServiceImpl.java"
        "java/com/android/server/voiceinteraction/VoiceInteractionManagerServiceShellCommand.java"
        "java/com/android/server/voiceinteraction/VoiceInteractionSessionConnection.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.voiceinteraction" = java_library_static {
    name = "services.voiceinteraction";
    defaults = ["services_defaults"];
    srcs = [":services.voiceinteraction-sources"];
    libs = ["services.core"];
};

in { inherit "services.voiceinteraction" "services.voiceinteraction-sources"; }

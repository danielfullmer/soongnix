{ aidl_interface }:
let

audio_common-aidl = aidl_interface {
    name = "audio_common-aidl";
    unstable = true;
    local_include_dir = "java";
    srcs = [
        "java/android/media/audio/common/AudioChannelMask.aidl"
        "java/android/media/audio/common/AudioConfig.aidl"
        "java/android/media/audio/common/AudioFormat.aidl"
        "java/android/media/audio/common/AudioOffloadInfo.aidl"
        "java/android/media/audio/common/AudioStreamType.aidl"
        "java/android/media/audio/common/AudioUsage.aidl"
    ];
    backend = {
        cpp = {
            enabled = true;
        };
        java = {
            #  Already generated as part of the entire media java library.
            enabled = false;
        };
    };
};

soundtrigger_middleware-aidl = aidl_interface {
    name = "soundtrigger_middleware-aidl";
    unstable = true;
    local_include_dir = "java";
    srcs = [
        "java/android/media/soundtrigger_middleware/ConfidenceLevel.aidl"
        "java/android/media/soundtrigger_middleware/ISoundTriggerCallback.aidl"
        "java/android/media/soundtrigger_middleware/ISoundTriggerMiddlewareService.aidl"
        "java/android/media/soundtrigger_middleware/ISoundTriggerModule.aidl"
        "java/android/media/soundtrigger_middleware/ModelParameter.aidl"
        "java/android/media/soundtrigger_middleware/ModelParameterRange.aidl"
        "java/android/media/soundtrigger_middleware/Phrase.aidl"
        "java/android/media/soundtrigger_middleware/PhraseRecognitionEvent.aidl"
        "java/android/media/soundtrigger_middleware/PhraseRecognitionExtra.aidl"
        "java/android/media/soundtrigger_middleware/PhraseSoundModel.aidl"
        "java/android/media/soundtrigger_middleware/RecognitionConfig.aidl"
        "java/android/media/soundtrigger_middleware/RecognitionEvent.aidl"
        "java/android/media/soundtrigger_middleware/RecognitionMode.aidl"
        "java/android/media/soundtrigger_middleware/RecognitionStatus.aidl"
        "java/android/media/soundtrigger_middleware/SoundModel.aidl"
        "java/android/media/soundtrigger_middleware/SoundModelType.aidl"
        "java/android/media/soundtrigger_middleware/SoundTriggerModuleDescriptor.aidl"
        "java/android/media/soundtrigger_middleware/SoundTriggerModuleProperties.aidl"
        "java/android/media/soundtrigger_middleware/Status.aidl"
    ];
    backend = {
        cpp = {
            enabled = true;
        };
        java = {
            #  Already generated as part of the entire media java library.
            enabled = false;
        };
        ndk = {
            #  Not currently needed, and disabled because of b/146172425
            enabled = false;
        };
    };
    imports = ["audio_common-aidl"];
};

in { inherit audio_common-aidl soundtrigger_middleware-aidl; }

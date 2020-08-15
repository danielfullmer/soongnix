{ android_app }:
let

SoundRecorder = android_app {
    name = "SoundRecorder";
    srcs = [
        "src/com/android/soundrecorder/Recorder.java"
        "src/com/android/soundrecorder/SoundRecorder.java"
        "src/com/android/soundrecorder/VUMeter.java"
    ];
    sdk_version = "current";
};

in { inherit SoundRecorder; }

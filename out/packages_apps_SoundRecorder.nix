{ android_app }:
let

SoundRecorder = android_app {
    name = "SoundRecorder";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit SoundRecorder; }

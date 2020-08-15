{ android_app }:
let

MusicFX = android_app {
    name = "MusicFX";
    srcs = [
        "src/com/android/audiofx/OpenSLESConstants.java"
        "src/com/android/musicfx/ActivityMusic.java"
        "src/com/android/musicfx/Compatibility.java"
        "src/com/android/musicfx/ControlPanelEffect.java"
        "src/com/android/musicfx/ControlPanelPicker.java"
        "src/com/android/musicfx/ControlPanelReceiver.java"
        "src/com/android/musicfx/SeekBarRotator.java"
    ];
    libs = ["framework"];
    platform_apis = true;
    privileged = true;
};

in { inherit MusicFX; }

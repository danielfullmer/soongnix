{ android_app }:
let

SoundPicker = android_app {
    name = "SoundPicker";
    manifest = "AndroidManifest.xml";

    static_libs = [
        "androidx.appcompat_appcompat"
    ];
    resource_dirs = [
        "res"
    ];
    srcs = [
        "src/com/android/soundpicker/CheckedListItem.java"
        "src/com/android/soundpicker/RingtoneOverlayService.java"
        "src/com/android/soundpicker/RingtonePickerActivity.java"
        "src/com/android/soundpicker/RingtoneReceiver.java"
    ];

    platform_apis = true;
    certificate = "media";
    privileged = true;
};

in { inherit SoundPicker; }

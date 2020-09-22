{ android_app }:
let

version_name = "1.00-aosp";
version_code = "100";

LeanbackIME = android_app {
    name = "LeanbackIME";

    sdk_version = "system_current";

    srcs = [
        "src/com/android/inputmethod/leanback/LeanbackKeyboardContainer.java"
        "src/com/android/inputmethod/leanback/LeanbackKeyboardController.java"
        "src/com/android/inputmethod/leanback/LeanbackKeyboardView.java"
        "src/com/android/inputmethod/leanback/LeanbackLocales.java"
        "src/com/android/inputmethod/leanback/LeanbackSuggestionsFactory.java"
        "src/com/android/inputmethod/leanback/LeanbackUtils.java"
        "src/com/android/inputmethod/leanback/service/LeanbackImeService.java"
        "src/com/android/inputmethod/leanback/voice/BitmapSoundLevelView.java"
        "src/com/android/inputmethod/leanback/voice/RecognizerView.java"
        "src/com/android/inputmethod/leanback/voice/SpeechLevelSource.java"
    ];

    optimize = {
        proguard_flags_files = ["proguard.cfg"];
        enabled = false;
    };

    resource_dirs = ["res"];

    aaptflags = [
        "--auto-add-overlay"

        "--version-name"
        version_name

        "--version-code"
        version_code
    ];
};

in { inherit LeanbackIME; }

{ android_app }:
let

SoftKeyboard = android_app {
    name = "SoftKeyboard";
    srcs = [
        "src/com/android/inputmethodcommon/InputMethodSettingsFragment.java"
        "src/com/android/inputmethodcommon/InputMethodSettingsImpl.java"
        "src/com/android/inputmethodcommon/InputMethodSettingsInterface.java"
        "src/com/example/android/softkeyboard/CandidateView.java"
        "src/com/example/android/softkeyboard/ImePreferences.java"
        "src/com/example/android/softkeyboard/LatinKeyboard.java"
        "src/com/example/android/softkeyboard/LatinKeyboardView.java"
        "src/com/example/android/softkeyboard/SoftKeyboard.java"
    ];
    min_sdk_version = "19";
    target_sdk_version = "29";
    sdk_version = "current";
    static_libs = [
        "androidx.annotation_annotation"
    ];
};

in { inherit SoftKeyboard; }

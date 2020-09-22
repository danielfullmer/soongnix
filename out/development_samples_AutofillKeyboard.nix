{ android_app }:
let

AutofillKeyboard = android_app {
    name = "AutofillKeyboard";
    srcs = [
        "src/com/example/android/autofillkeyboard/AutofillImeService.java"
        "src/com/example/android/autofillkeyboard/Decoder.java"
        "src/com/example/android/autofillkeyboard/InlineContentClipView.java"
        "src/com/example/android/autofillkeyboard/InputView.java"
        "src/com/example/android/autofillkeyboard/Keyboard.java"
    ];
    min_sdk_version = "29";
    target_sdk_version = "30";
    sdk_version = "current";
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.autofill_autofill"
        "android-support-annotations"
    ];
};

in { inherit AutofillKeyboard; }

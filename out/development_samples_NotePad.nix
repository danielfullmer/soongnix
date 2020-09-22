{ android_app }:
let

NotePad = android_app {
    name = "NotePad";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/notepad/NoteEditor.java"
        "src/com/example/android/notepad/NotePad.java"
        "src/com/example/android/notepad/NotePadProvider.java"
        "src/com/example/android/notepad/NotesList.java"
        "src/com/example/android/notepad/TitleEditor.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit NotePad; }

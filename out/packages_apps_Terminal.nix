{ android_app }:
let

subdirs = [
    "jni"
];
Terminal = android_app {
    name = "Terminal";
    srcs = [
        "src/com/android/terminal/Terminal.java"
        "src/com/android/terminal/TerminalActivity.java"
        "src/com/android/terminal/TerminalCallbacks.java"
        "src/com/android/terminal/TerminalKeys.java"
        "src/com/android/terminal/TerminalLineView.java"
        "src/com/android/terminal/TerminalService.java"
        "src/com/android/terminal/TerminalView.java"
    ];
    static_libs = ["androidx.viewpager_viewpager"];
    jni_libs = ["libjni_terminal"];
    #  TODO: enable proguard once development has settled down
    # LOCAL_PROGUARD_FLAG_FILES := proguard.flags
    optimize = {
        enabled = false;
    };
    platform_apis = true;
};

in { inherit Terminal; }

{ android_app }:
let

Shell = android_app {
    name = "Shell";
    srcs = [
        "src/com/android/shell/BugreportPrefs.java"
        "src/com/android/shell/BugreportProgressService.java"
        "src/com/android/shell/BugreportRequestedReceiver.java"
        "src/com/android/shell/BugreportStorageProvider.java"
        "src/com/android/shell/BugreportWarningActivity.java"
        "src/com/android/shell/HeapDumpActivity.java"
        "src/com/android/shell/HeapDumpProvider.java"
        "src/com/android/shell/HeapDumpReceiver.java"
        "src/com/android/shell/Screenshooter.java"
        ":dumpstate_aidl"
    ];
    aidl = {
        include_dirs = ["frameworks/native/cmds/dumpstate/binder"];
    };
    static_libs = ["androidx.legacy_legacy-support-v4"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    jacoco = {
        include_filter = ["com.android.shell.*"];
    };
};

in { inherit Shell; }

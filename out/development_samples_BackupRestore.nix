{ android_app }:
let

BackupRestore = android_app {
    name = "BackupRestore";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/example/android/backuprestore/BackupRestoreActivity.java"
        "src/com/example/android/backuprestore/ExampleAgent.java"
        "src/com/example/android/backuprestore/FileHelperExampleAgent.java"
        "src/com/example/android/backuprestore/MultiRecordExampleAgent.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit BackupRestore; }

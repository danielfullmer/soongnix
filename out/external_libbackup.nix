{ android_library }:
let

libbackup = android_library {
    name = "libbackup";
    sdk_version = "current";
    srcs = [
        #  All but src/com/google/android/libraries/backup/shadow/*.java
        "src/com/google/android/libraries/backup/Backup.java"
        "src/com/google/android/libraries/backup/BackupKeyPredicate.java"
        "src/com/google/android/libraries/backup/BackupKeyPredicates.java"
        "src/com/google/android/libraries/backup/PersistentBackupAgentHelper.java"
        "src/com/google/android/libraries/backup/PreferenceBackupUtil.java"
    ];
    static_libs = ["android-support-v4"];
};

in { inherit libbackup; }

{ android_test }:
let

HugeBackup = android_test {
    name = "HugeBackup";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/hugebackup/HugeAgent.java"
        "src/com/android/hugebackup/HugeBackupActivity.java"
    ];
    sdk_version = "current";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit HugeBackup; }

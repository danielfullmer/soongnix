{ android_app }:
let

CallLogBackup = android_app {
    name = "CallLogBackup";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/calllogbackup/CallLogBackupAgent.java"
        "src/com/android/calllogbackup/CallLogChangeReceiver.java"
    ];

    #  The Jacoco tool analyzes code coverage when running unit tests on the
    #  application. This configuration line selects which packages will be analyzed,
    #  leaving out code which is tested by other means (e.g. static libraries) that
    #  would dilute the coverage results. These options do not affect regular
    #  production builds.
    jacoco = {
        include_filter = ["com.android.calllogbackup.*"];
    };
    platform_apis = true;
    certificate = "shared";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

};

in { inherit CallLogBackup; }

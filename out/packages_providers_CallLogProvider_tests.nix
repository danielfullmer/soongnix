{ android_test }:
let

CallLogBackupTests = android_test {
    name = "CallLogBackupTests";
    static_libs = ["mockito-target"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    instrumentation_for = "CallLogBackup";
    certificate = "shared";
    optimize = {
        enabled = false;
    };
};

in { inherit CallLogBackupTests; }

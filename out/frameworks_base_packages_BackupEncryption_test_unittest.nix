{ android_test }:
let

BackupEncryptionUnitTests = android_test {
    name = "BackupEncryptionUnitTests";
    srcs = [
        "src/com/android/server/backup/encryption/transport/IntermediateEncryptingTransportManagerTest.java"
        "src/com/android/server/backup/encryption/transport/IntermediateEncryptingTransportTest.java"
    ];
    static_libs = [
        "androidx.test.runner"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "platform-test-annotations"
        "truth-prebuilt"
        "testables"
        "testng"
    ];
    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
        "BackupEncryption"
    ];
    test_suites = ["device-tests"];
    instrumentation_for = "BackupEncryption";
    certificate = "platform";
};

in { inherit BackupEncryptionUnitTests; }

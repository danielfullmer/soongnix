{ android_test }:
let

VaultTests = android_test {
    name = "VaultTests";
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/com/example/android/vault/EncryptedDocumentTest.java"
        "src/com/example/android/vault/VaultProviderTest.java"
    ];
    instrumentation_for = "Vault";
    static_libs = ["androidx.test.rules"];
};

in { inherit VaultTests; }

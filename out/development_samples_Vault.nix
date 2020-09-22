{ android_test_helper_app }:
let

Vault = android_test_helper_app {
    name = "Vault";
    srcs = [
        "src/com/example/android/vault/EncryptedDocument.java"
        "src/com/example/android/vault/SecretKeyWrapper.java"
        "src/com/example/android/vault/Utils.java"
        "src/com/example/android/vault/VaultProvider.java"
        "tests/src/com/example/android/vault/EncryptedDocumentTest.java"
        "tests/src/com/example/android/vault/VaultProviderTest.java"
    ];
    static_libs = ["junit"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit Vault; }

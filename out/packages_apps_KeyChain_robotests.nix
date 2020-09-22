{ android_robolectric_test }:
let

# ############################################################
#  KeyChain Robolectric test target.                         #
# ############################################################

KeyChainRoboTests = android_robolectric_test {
    name = "KeyChainRoboTests";

    srcs = [
        "src/com/android/keychain/AliasLoaderTest.java"
        "src/com/android/keychain/KeyChainServiceRoboTest.java"
        "src/com/android/keychain/ShadowKeyStore.java"
        "src/com/android/keychain/ShadowTrustedCertificateStore.java"
        "src/com/android/keychain/internal/GrantsDatabaseTest.java"
    ];

    java_resource_dirs = ["config"];

    instrumentation_for = "KeyChain";
};

in { inherit KeyChainRoboTests; }

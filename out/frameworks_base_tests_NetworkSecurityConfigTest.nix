{ android_test }:
let

NetworkSecurityConfigTests = android_test {
    name = "NetworkSecurityConfigTests";
    certificate = "platform";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    #  Include all test java files.
    srcs = [
        "src/android/security/net/config/NetworkSecurityConfigTests.java"
        "src/android/security/net/config/TestCertificateSource.java"
        "src/android/security/net/config/TestConfigSource.java"
        "src/android/security/net/config/TestUtils.java"
        "src/android/security/net/config/XmlConfigTests.java"
    ];
    platform_apis = true;
};

in { inherit NetworkSecurityConfigTests; }

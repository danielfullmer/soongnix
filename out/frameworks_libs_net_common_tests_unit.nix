{ android_library, android_test }:
let

# ########################################################################
#  Build NetworkStaticLibTests package
# ########################################################################

NetworkStaticLibTestsLib = android_library {
    name = "NetworkStaticLibTestsLib";
    srcs = [
        "src/android/net/util/IpRangeTest.java"
        "src/android/net/util/LinkPropertiesUtilsTest.java"
        "src/android/net/util/MacAddressUtilsTest.java"
        "src/android/net/util/NetUtilsTest.java"
        "src/com/android/module/util/DnsPacketTest.java"
        "src/com/android/net/module/util/Inet4AddressUtilsTest.java"
    ];
    min_sdk_version = "29";
    jarjar_rules = "jarjar-rules.txt";
    static_libs = [
        "net-utils-framework-common"
        "androidx.test.rules"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    visibility = [
        "//frameworks/base/packages/Tethering/tests/integration"
        "//packages/modules/NetworkStack/tests/integration"
    ];
};

NetworkStaticLibTests = android_test {
    name = "NetworkStaticLibTests";
    certificate = "platform";
    static_libs = [
        "NetworkStaticLibTestsLib"
    ];
    test_suites = ["device-tests"];
};

in { inherit NetworkStaticLibTests NetworkStaticLibTestsLib; }

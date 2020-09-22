{ android_test, java_defaults }:
let

# ########################################################################
#  Build FrameworksNetTests package
# ########################################################################
FrameworksNetTests-jni-defaults = java_defaults {
    name = "FrameworksNetTests-jni-defaults";
    jni_libs = [
        "ld-android"
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbpf"
        "libbpf_android"
        "libc++"
        "libcgrouprc"
        "libcrypto"
        "libcutils"
        "libdl_android"
        "libhidl-gen-utils"
        "libhidlbase"
        "libjsoncpp"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libnetdbpf"
        "libnetdutils"
        "libnetworkstatsfactorytestjni"
        "libpackagelistparser"
        "libpcre2"
        "libprocessgroup"
        "libselinux"
        "libtinyxml2"
        "libui"
        "libunwindstack"
        "libutils"
        "libutilscallstack"
        "libvndksupport"
        "libziparchive"
        "libz"
        "netd_aidl_interface-cpp"
    ];
};

FrameworksNetTests = android_test {
    name = "FrameworksNetTests";
    defaults = ["FrameworksNetTests-jni-defaults"];
    srcs = [
        "java/android/app/usage/NetworkStatsManagerTest.java"
        "java/android/net/ConnectivityDiagnosticsManagerTest.java"
        "java/android/net/ConnectivityManagerTest.java"
        "java/android/net/Ikev2VpnProfileTest.java"
        "java/android/net/IpMemoryStoreTest.java"
        "java/android/net/IpSecAlgorithmTest.java"
        "java/android/net/IpSecConfigTest.java"
        "java/android/net/IpSecManagerTest.java"
        "java/android/net/IpSecTransformTest.java"
        "java/android/net/MacAddressTest.java"
        "java/android/net/NetworkStatsHistoryTest.java"
        "java/android/net/NetworkStatsTest.java"
        "java/android/net/NetworkUtilsTest.java"
        "java/android/net/TcpKeepalivePacketDataTest.java"
        "java/android/net/TelephonyNetworkSpecifierTest.java"
        "java/android/net/UidRangeTest.java"
        "java/android/net/VpnManagerTest.java"
        "java/android/net/ipmemorystore/ParcelableTests.java"
        "java/android/net/nsd/NsdManagerTest.java"
        "java/android/net/nsd/NsdServiceInfoTest.java"
        "java/android/net/util/DnsUtilsTest.java"
        "java/android/net/util/IpUtilsTest.java"
        "java/com/android/internal/net/VpnProfileTest.java"
        "java/com/android/internal/util/BitUtilsTest.java"
        "java/com/android/internal/util/RingBufferTest.java"
        "java/com/android/server/ConnectivityServiceTest.java"
        "java/com/android/server/IpSecServiceParameterizedTest.java"
        "java/com/android/server/IpSecServiceRefcountedResourceTest.java"
        "java/com/android/server/IpSecServiceTest.java"
        "java/com/android/server/NetworkManagementServiceTest.java"
        "java/com/android/server/NsdServiceTest.java"
        "java/com/android/server/connectivity/DnsManagerTest.java"
        "java/com/android/server/connectivity/IpConnectivityEventBuilderTest.java"
        "java/com/android/server/connectivity/IpConnectivityMetricsTest.java"
        "java/com/android/server/connectivity/LingerMonitorTest.java"
        "java/com/android/server/connectivity/MetricsTestUtil.java"
        "java/com/android/server/connectivity/MultipathPolicyTrackerTest.java"
        "java/com/android/server/connectivity/Nat464XlatTest.java"
        "java/com/android/server/connectivity/NetdEventListenerServiceTest.java"
        "java/com/android/server/connectivity/NetworkNotificationManagerTest.java"
        "java/com/android/server/connectivity/PermissionMonitorTest.java"
        "java/com/android/server/connectivity/VpnTest.java"
        "java/com/android/server/net/NetworkStatsAccessTest.java"
        "java/com/android/server/net/NetworkStatsBaseTest.java"
        "java/com/android/server/net/NetworkStatsCollectionTest.java"
        "java/com/android/server/net/NetworkStatsFactoryTest.java"
        "java/com/android/server/net/NetworkStatsObserversTest.java"
        "java/com/android/server/net/NetworkStatsServiceTest.java"
        "java/com/android/server/net/NetworkStatsSubscriptionsMonitorTest.java"
        "java/com/android/server/net/ipmemorystore/NetworkAttributesTest.java"
        "java/android/net/NetworkTemplateTest.kt"
        "java/android/net/util/KeepaliveUtilsTest.kt"
        "java/com/android/server/LegacyTypeTrackerTest.kt"
        "java/com/android/server/NetIdManagerTest.kt"
        "java/com/android/server/connectivity/NetworkRankerTest.kt"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
    static_libs = [
        "androidx.test.rules"
        "FrameworksNetCommonTests"
        "frameworks-base-testutils"
        "frameworks-net-integration-testutils"
        "framework-protos"
        "mockito-target-minus-junit4"
        "net-tests-utils"
        "platform-test-annotations"
        "services.core"
        "services.net"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
};

in { inherit FrameworksNetTests FrameworksNetTests-jni-defaults; }

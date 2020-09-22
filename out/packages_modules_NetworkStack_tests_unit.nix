{ android_library, android_test, java_defaults }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

NetworkStackTestsDefaults = java_defaults {
    name = "NetworkStackTestsDefaults";
    platform_apis = true;
    srcs = [
        "src/android/net/apf/ApfTest.java"
        "src/android/net/apf/Bpf2Apf.java"
        "src/android/net/captiveportal/CaptivePortalProbeSpecTest.java"
        "src/android/net/dhcp/DhcpLeaseRepositoryTest.java"
        "src/android/net/dhcp/DhcpPacketTest.java"
        "src/android/net/dhcp/DhcpResultsParcelableUtilTest.java"
        "src/android/net/dhcp/DhcpServerTest.java"
        "src/android/net/dhcp/DhcpServingParamsTest.java"
        "src/android/net/ip/InterfaceControllerTest.java"
        "src/android/net/ip/IpClientTest.java"
        "src/android/net/netlink/ConntrackMessageTest.java"
        "src/android/net/netlink/InetDiagSocketTest.java"
        "src/android/net/netlink/NduseroptMessageTest.java"
        "src/android/net/netlink/NetlinkErrorMessageTest.java"
        "src/android/net/netlink/NetlinkSocketTest.java"
        "src/android/net/netlink/RtNetlinkNeighborMessageTest.java"
        "src/android/net/netlink/StructNdOptPref64Test.java"
        "src/android/net/shared/InitialConfigurationTest.java"
        "src/android/net/shared/NetdUtilsTest.java"
        "src/android/net/shared/ProvisioningConfigurationTest.java"
        "src/android/net/util/ConnectivityPacketSummaryTest.java"
        "src/android/net/util/HostnameTransliteratorTest.java"
        "src/android/net/util/InterfaceParamsTest.java"
        "src/android/net/util/NetworkStackUtilsTest.java"
        "src/android/net/util/PacketReaderTest.java"
        "src/com/android/networkstack/arp/ArpPacketTest.java"
        "src/com/android/networkstack/metrics/NetworkIpProvisioningMetricsTest.java"
        "src/com/android/networkstack/metrics/NetworkValidationMetricsTest.java"
        "src/com/android/networkstack/netlink/TcpInfoTest.java"
        "src/com/android/networkstack/netlink/TcpSocketTrackerTest.java"
        "src/com/android/server/connectivity/NetworkMonitorTest.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreServiceTest.java"
        "src/com/android/server/connectivity/ipmemorystore/RelevanceUtilsTests.java"
        "src/com/android/server/util/SharedLogTest.java"
        "src/android/net/dhcp/DhcpLeaseTest.kt"
        "src/android/net/ip/IpReachabilityMonitorTest.kt"
        "src/android/net/netlink/NetlinkTestUtils.kt"
        "src/android/net/networkstack/ModuleNetworkStackClientTest.kt"
        "src/android/net/testutils/HandlerUtilsTest.kt"
        "src/android/net/testutils/NetworkStatsUtilsTest.kt"
        "src/android/net/testutils/TestableNetworkCallbackTest.kt"
        "src/android/net/testutils/TrackRecordTest.kt"
        "src/com/android/networkstack/NetworkStackNotifierTest.kt"
        "src/com/android/networkstack/metrics/DataStallStatsUtilsTest.kt"
        "src/com/android/networkstack/util/DnsUtilsTest.kt"
        "src/com/android/server/NetworkStackServiceTest.kt"
    ];
    resource_dirs = ["res"];
    static_libs = [
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "kotlin-reflect"
        "mockito-target-extended-minus-junit4"
        "net-tests-utils"
        "testables"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    defaults = ["libnetworkstackutilsjni_deps"];
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
        "libnetworkstackutilsjni"
    ];
    jni_uses_sdk_apis = true;
    jarjar_rules = ":NetworkStackJarJarRules";
};

#  Tests for NetworkStackNext.
NetworkStackNextTests = android_test {
    name = "NetworkStackNextTests";
    srcs = []; #  TODO: tests that only apply to the current, non-stable API can be added here
    test_suites = ["device-tests"];
    defaults = ["NetworkStackTestsDefaults"];
    static_libs = ["NetworkStackApiCurrentLib"];
};

#  Library containing the unit tests. This is used by the coverage test target to pull in the
#  unit test code. It is not currently used by the tests themselves because all the build
#  configuration needed by the tests is in the NetworkStackTestsDefaults rule.
NetworkStackTestsLib = android_library {
    name = "NetworkStackTestsLib";
    min_sdk_version = "29";
    defaults = ["NetworkStackTestsDefaults"];
    static_libs = ["NetworkStackApiStableLib"];
    visibility = [
        "//packages/modules/NetworkStack/tests/integration"
        "//frameworks/base/packages/Tethering/tests/integration"
    ];
};

NetworkStackTests = android_test {
    name = "NetworkStackTests";
    min_sdk_version = "29";
    test_suites = [
        "device-tests"
        "mts"
    ];
    defaults = ["NetworkStackTestsDefaults"];
    static_libs = ["NetworkStackApiStableLib"];
    compile_multilib = "both";
};

#  Additional dependencies of libnetworkstackutilsjni that are not provided by the system when
#  running as a test application.
#  Using java_defaults as jni_libs does not support filegroups.
libnetworkstackutilsjni_deps = java_defaults {
    name = "libnetworkstackutilsjni_deps";
    jni_libs = [
        "libnativehelper_compat_libc++"
        "libnetworkstacktestsjni"
    ];
};

in { inherit NetworkStackNextTests NetworkStackTests NetworkStackTestsDefaults NetworkStackTestsLib libnetworkstackutilsjni_deps; }

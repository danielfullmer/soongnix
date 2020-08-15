{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsNetTestCases = android_test {
    name = "CtsNetTestCases";
    defaults = ["cts_defaults"];

    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";

    libs = [
        "voip-common"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];

    jni_libs = [
        "libcts_jni"
        "libnativedns_jni"
        "libnativemultinetwork_jni"
        "libnativehelper_compat_libc++"
    ];

    #  include CtsTestServer as a temporary hack to free net.cts from cts.stub.
    srcs = [
        "src/android/net/cts/AirplaneModeTest.java"
        "src/android/net/cts/ConnectivityManagerTest.java"
        "src/android/net/cts/CredentialsTest.java"
        "src/android/net/cts/DhcpInfoTest.java"
        "src/android/net/cts/DnsResolverTest.java"
        "src/android/net/cts/DnsTest.java"
        "src/android/net/cts/InetAddressesTest.java"
        "src/android/net/cts/IpSecBaseTest.java"
        "src/android/net/cts/IpSecManagerTest.java"
        "src/android/net/cts/IpSecManagerTunnelTest.java"
        "src/android/net/cts/LocalServerSocketTest.java"
        "src/android/net/cts/LocalSocketAddressTest.java"
        "src/android/net/cts/LocalSocketAddress_NamespaceTest.java"
        "src/android/net/cts/LocalSocketTest.java"
        "src/android/net/cts/MacAddressTest.java"
        "src/android/net/cts/MailToTest.java"
        "src/android/net/cts/MultinetworkApiTest.java"
        "src/android/net/cts/NetworkInfoTest.java"
        "src/android/net/cts/NetworkInfo_DetailedStateTest.java"
        "src/android/net/cts/NetworkInfo_StateTest.java"
        "src/android/net/cts/NetworkRequestTest.java"
        "src/android/net/cts/NetworkWatchlistTest.java"
        "src/android/net/cts/PacketUtils.java"
        "src/android/net/cts/ProxyTest.java"
        "src/android/net/cts/SSLCertificateSocketFactoryTest.java"
        "src/android/net/cts/TheaterModeTest.java"
        "src/android/net/cts/TrafficStatsTest.java"
        "src/android/net/cts/TunUtils.java"
        "src/android/net/cts/UriTest.java"
        "src/android/net/cts/Uri_BuilderTest.java"
        "src/android/net/cts/UrlQuerySanitizerTest.java"
        "src/android/net/cts/UrlQuerySanitizer_IllegalCharacterValueSanitizerTest.java"
        "src/android/net/cts/UrlQuerySanitizer_ParameterValuePairTest.java"
        "src/android/net/cts/VpnServiceTest.java"
        "src/android/net/http/cts/ApacheHttpClientTest.java"
        "src/android/net/http/cts/HttpResponseCacheTest.java"
        "src/android/net/http/cts/SslCertificateTest.java"
        "src/android/net/http/cts/SslCertificate_DNameTest.java"
        "src/android/net/http/cts/SslErrorTest.java"
        "src/android/net/http/cts/X509TrustManagerExtensionsTest.java"
        "src/android/net/ipv6/cts/PingTest.java"
        "src/android/net/rtp/cts/AudioCodecTest.java"
        "src/android/net/rtp/cts/AudioGroupTest.java"
        "src/android/net/rtp/cts/AudioStreamTest.java"
        "src/android/net/wifi/aware/cts/SingleDeviceTest.java"
        "src/android/net/wifi/aware/cts/TestUtils.java"
        "src/android/net/wifi/cts/ConcurrencyTest.java"
        "src/android/net/wifi/cts/ConfigParserTest.java"
        "src/android/net/wifi/cts/FakeKeys.java"
        "src/android/net/wifi/cts/MulticastLockTest.java"
        "src/android/net/wifi/cts/NsdManagerTest.java"
        "src/android/net/wifi/cts/PpsMoParserTest.java"
        "src/android/net/wifi/cts/ScanResultTest.java"
        "src/android/net/wifi/cts/SupplicantStateTest.java"
        "src/android/net/wifi/cts/WifiConfigurationTest.java"
        "src/android/net/wifi/cts/WifiEnterpriseConfigTest.java"
        "src/android/net/wifi/cts/WifiFeature.java"
        "src/android/net/wifi/cts/WifiInfoTest.java"
        "src/android/net/wifi/cts/WifiLockTest.java"
        "src/android/net/wifi/cts/WifiManagerTest.java"
        "src/android/net/wifi/p2p/cts/WifiP2pConfigTest.java"
        "src/android/net/wifi/rtt/cts/TestBase.java"
        "src/android/net/wifi/rtt/cts/WifiRttTest.java"
        "src/org/apache/http/conn/ssl/cts/AbstractVerifierTest.java"

    ];

    static_libs = [
        "FrameworksNetCommonTests"
        "core-tests-support"
        "compatibility-device-util-axt"
        "cts-net-utils"
        "ctstestrunner-axt"
        "ctstestserver"
        "mockwebserver"
        "junit"
        "junit-params"
        "truth-prebuilt"
    ];

    #  uncomment when b/13249961 is fixed
    #  sdk_version: "current",
    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "mts"
    ];

};

in { inherit CtsNetTestCases; }

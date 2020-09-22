{ android_test, java_defaults }:
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

CtsNetTestCasesDefaults = java_defaults {
    name = "CtsNetTestCasesDefaults";
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

    srcs = [
        "src/android/net/cts/AirplaneModeTest.java"
        "src/android/net/cts/ConnectivityDiagnosticsManagerTest.java"
        "src/android/net/cts/ConnectivityManagerTest.java"
        "src/android/net/cts/CredentialsTest.java"
        "src/android/net/cts/DnsResolverTest.java"
        "src/android/net/cts/DnsTest.java"
        "src/android/net/cts/IkeTunUtils.java"
        "src/android/net/cts/Ikev2VpnTest.java"
        "src/android/net/cts/InetAddressesTest.java"
        "src/android/net/cts/IpConfigurationTest.java"
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
        "src/android/net/cts/NetworkInfo_DetailedStateTest.java"
        "src/android/net/cts/NetworkInfo_StateTest.java"
        "src/android/net/cts/NetworkRequestTest.java"
        "src/android/net/cts/NetworkStatsBinderTest.java"
        "src/android/net/cts/NetworkWatchlistTest.java"
        "src/android/net/cts/PacketUtils.java"
        "src/android/net/cts/ProxyInfoTest.java"
        "src/android/net/cts/ProxyTest.java"
        "src/android/net/cts/RssiCurveTest.java"
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
        "src/org/apache/http/conn/ssl/cts/AbstractVerifierTest.java"
        "src/android/net/cts/CaptivePortalApiTest.kt"
        "src/android/net/cts/CaptivePortalTest.kt"
        "src/android/net/cts/NetworkAgentTest.kt"
        "src/android/net/cts/NetworkInfoTest.kt"
    ];
    jarjar_rules = "jarjar-rules-shared.txt";
    static_libs = [
        "FrameworksNetCommonTests"
        "TestNetworkStackLib"
        "compatibility-device-util-axt"
        "core-tests-support"
        "cts-net-utils"
        "ctstestrunner-axt"
        "ctstestserver"
        "junit"
        "junit-params"
        "libnanohttpd"
        "mockwebserver"
        "net-utils-framework-common"
        "truth-prebuilt"
    ];

    #  uncomment when b/13249961 is fixed
    #  sdk_version: "current",
    platform_apis = true;
};

#  Networking CTS tests for development and release. These tests always target the platform SDK
#  version, and are subject to all the restrictions appropriate to that version. Before SDK
#  finalization, these tests have a min_sdk_version of 10000, and cannot be installed on release
#  devices.
CtsNetTestCases = android_test {
    name = "CtsNetTestCases";
    defaults = ["CtsNetTestCasesDefaults"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    test_config_template = "AndroidTestTemplate.xml";
};

#  Networking CTS tests that target the latest released SDK. These tests can be installed on release
#  devices at any point in the Android release cycle and are useful for qualifying mainline modules
#  on release devices.
CtsNetTestCasesLatestSdk = android_test {
    name = "CtsNetTestCasesLatestSdk";
    defaults = ["CtsNetTestCasesDefaults"];
    jni_uses_sdk_apis = true;
    min_sdk_version = "29";
    target_sdk_version = "30";
    test_suites = [
        "general-tests"
        "mts"
    ];
    test_config_template = "AndroidTestTemplate.xml";
};

in { inherit CtsNetTestCases CtsNetTestCasesDefaults CtsNetTestCasesLatestSdk; }

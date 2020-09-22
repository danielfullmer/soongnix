{ java_library }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

#  Tests in this folder are included both in unit tests and CTS.
#  They must be fast and stable, and exercise public or test APIs.
FrameworksNetCommonTests = java_library {
    name = "FrameworksNetCommonTests";
    srcs = [
        "java/android/net/CaptivePortalTest.java"
        "java/android/net/DependenciesTest.java"
        "java/android/net/DhcpInfoTest.java"
        "java/android/net/IpPrefixTest.java"
        "java/android/net/LinkAddressTest.java"
        "java/android/net/LinkPropertiesTest.java"
        "java/android/net/NetworkCapabilitiesTest.java"
        "java/android/net/NetworkStackTest.java"
        "java/android/net/NetworkTest.java"
        "java/android/net/RouteInfoTest.java"
        "java/android/net/StaticIpConfigurationTest.java"
        "java/android/net/apf/ApfCapabilitiesTest.java"
        "java/android/net/metrics/IpConnectivityLogTest.java"
        "java/android/net/CaptivePortalDataTest.kt"
        "java/android/net/KeepalivePacketDataTest.kt"
        "java/android/net/MatchAllNetworkSpecifierTest.kt"
        "java/android/net/NattKeepalivePacketDataTest.kt"
        "java/android/net/NetworkAgentConfigTest.kt"
        "java/android/net/NetworkProviderTest.kt"
        "java/android/net/NetworkSpecifierTest.kt"
        "java/android/net/metrics/ApfProgramEventTest.kt"
        "java/android/net/metrics/ApfStatsTest.kt"
        "java/android/net/metrics/DhcpClientEventTest.kt"
        "java/android/net/metrics/DhcpErrorEventTest.kt"
        "java/android/net/metrics/IpManagerEventTest.kt"
        "java/android/net/metrics/IpReachabilityEventTest.kt"
        "java/android/net/metrics/NetworkEventTest.kt"
        "java/android/net/metrics/RaEventTest.kt"
        "java/android/net/metrics/ValidationProbeEventTest.kt"
        "java/android/net/netstats/NetworkStatsApiTest.kt"
        "java/android/net/util/SocketUtilsTest.kt"
    ];
    static_libs = [
        "androidx.core_core"
        "androidx.test.rules"
        "junit"
        "mockito-target-minus-junit4"
        "net-tests-utils"
        "platform-test-annotations"
    ];
    libs = [
        "android.test.base.stubs"
    ];
};

in { inherit FrameworksNetCommonTests; }

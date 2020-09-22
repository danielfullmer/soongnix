{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

#  Make test APK
#  ============================================================

FrameworksWifiApiTests = android_test {
    name = "FrameworksWifiApiTests";

    defaults = ["framework-wifi-test-defaults"];

    srcs = [
        "src/android/net/wifi/EasyConnectStatusCallbackTest.java"
        "src/android/net/wifi/FakeKeys.java"
        "src/android/net/wifi/ParcelUtilTest.java"
        "src/android/net/wifi/ScanResultTest.java"
        "src/android/net/wifi/SoftApCapabilityTest.java"
        "src/android/net/wifi/SoftApConfToXmlMigrationUtilTest.java"
        "src/android/net/wifi/SoftApConfigurationTest.java"
        "src/android/net/wifi/SoftApInfoTest.java"
        "src/android/net/wifi/WifiClientTest.java"
        "src/android/net/wifi/WifiConfigurationTest.java"
        "src/android/net/wifi/WifiEnterpriseConfigTest.java"
        "src/android/net/wifi/WifiInfoTest.java"
        "src/android/net/wifi/WifiManagerTest.java"
        "src/android/net/wifi/WifiNetworkAgentSpecifierTest.java"
        "src/android/net/wifi/WifiNetworkScoreCacheTest.java"
        "src/android/net/wifi/WifiNetworkSpecifierTest.java"
        "src/android/net/wifi/WifiNetworkSuggestionTest.java"
        "src/android/net/wifi/WifiScannerTest.java"
        "src/android/net/wifi/WifiSsidTest.java"
        "src/android/net/wifi/WifiUsabilityStatsEntryTest.java"
        "src/android/net/wifi/aware/TlvBufferUtilsTest.java"
        "src/android/net/wifi/aware/WifiAwareAgentNetworkSpecifierTest.java"
        "src/android/net/wifi/aware/WifiAwareManagerTest.java"
        "src/android/net/wifi/hotspot2/ConfigParserTest.java"
        "src/android/net/wifi/hotspot2/OsuProviderTest.java"
        "src/android/net/wifi/hotspot2/PasspointConfigurationTest.java"
        "src/android/net/wifi/hotspot2/PasspointTestUtils.java"
        "src/android/net/wifi/hotspot2/omadm/PpsMoParserTest.java"
        "src/android/net/wifi/hotspot2/omadm/XMLParserTest.java"
        "src/android/net/wifi/hotspot2/pps/CredentialTest.java"
        "src/android/net/wifi/hotspot2/pps/HomeSpTest.java"
        "src/android/net/wifi/hotspot2/pps/PolicyTest.java"
        "src/android/net/wifi/hotspot2/pps/UpdateParameterTest.java"
        "src/android/net/wifi/nl80211/DeviceWiphyCapabilitiesTest.java"
        "src/android/net/wifi/nl80211/NativeScanResultTest.java"
        "src/android/net/wifi/nl80211/PnoSettingsTest.java"
        "src/android/net/wifi/nl80211/SingleScanSettingsTest.java"
        "src/android/net/wifi/nl80211/WifiNl80211ManagerTest.java"
        "src/android/net/wifi/p2p/WifiP2pConfigTest.java"
        "src/android/net/wifi/p2p/WifiP2pDeviceListTest.java"
        "src/android/net/wifi/p2p/WifiP2pDeviceTest.java"
        "src/android/net/wifi/p2p/WifiP2pGroupListTest.java"
        "src/android/net/wifi/p2p/WifiP2pGroupTest.java"
        "src/android/net/wifi/p2p/WifiP2pInfoTest.java"
        "src/android/net/wifi/p2p/WifiP2pManagerTest.java"
        "src/android/net/wifi/p2p/WifiP2pProvDiscEventTest.java"
        "src/android/net/wifi/p2p/WifiP2pWfdInfoTest.java"
        "src/android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceInfoTest.java"
        "src/android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceRequestTest.java"
        "src/android/net/wifi/p2p/nsd/WifiP2pUpnpServiceInfoTest.java"
        "src/android/net/wifi/p2p/nsd/WifiP2pUpnpServiceRequestTest.java"
        "src/android/net/wifi/rtt/CivicLocationTest.java"
        "src/android/net/wifi/rtt/ResponderLocationTest.java"
        "src/android/net/wifi/rtt/WifiRttManagerTest.java"
        "src/android/net/wifi/util/HexEncodingTest.java"
    ];

    jacoco = {
        include_filter = ["android.net.wifi.*"];
        #  TODO(b/147521214) need to exclude test classes
        exclude_filter = [];
    };

    static_libs = [
        "androidx.test.rules"
        "core-test-rules"
        "guava"
        "mockito-target-minus-junit4"
        "net-tests-utils"
        "frameworks-base-testutils"
        "truth-prebuilt"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    test_suites = [
        "device-tests"
        "mts"
    ];
};

in { inherit FrameworksWifiApiTests; }

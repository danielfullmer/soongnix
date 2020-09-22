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

CtsWifiTestCases = android_test {
    name = "CtsWifiTestCases";
    defaults = ["cts_defaults"];

    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";

    libs = [
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/net/wifi/aware/cts/SingleDeviceTest.java"
        "src/android/net/wifi/aware/cts/TestUtils.java"
        "src/android/net/wifi/cts/ConcurrencyTest.java"
        "src/android/net/wifi/cts/ConfigParserTest.java"
        "src/android/net/wifi/cts/ConnectedNetworkScorerTest.java"
        "src/android/net/wifi/cts/EasyConnectStatusCallbackTest.java"
        "src/android/net/wifi/cts/FakeKeys.java"
        "src/android/net/wifi/cts/MulticastLockTest.java"
        "src/android/net/wifi/cts/NsdManagerTest.java"
        "src/android/net/wifi/cts/PpsMoParserTest.java"
        "src/android/net/wifi/cts/ScanResultTest.java"
        "src/android/net/wifi/cts/SupplicantStateTest.java"
        "src/android/net/wifi/cts/WaitForResultActivity.java"
        "src/android/net/wifi/cts/WifiBackupRestoreTest.java"
        "src/android/net/wifi/cts/WifiConfigurationTest.java"
        "src/android/net/wifi/cts/WifiEnterpriseConfigTest.java"
        "src/android/net/wifi/cts/WifiFeature.java"
        "src/android/net/wifi/cts/WifiFrameworkInitializerTest.java"
        "src/android/net/wifi/cts/WifiHotspot2Test.java"
        "src/android/net/wifi/cts/WifiInfoTest.java"
        "src/android/net/wifi/cts/WifiJUnit3TestBase.java"
        "src/android/net/wifi/cts/WifiJUnit4TestBase.java"
        "src/android/net/wifi/cts/WifiLocationInfoTest.java"
        "src/android/net/wifi/cts/WifiLockTest.java"
        "src/android/net/wifi/cts/WifiManagerTest.java"
        "src/android/net/wifi/cts/WifiMigrationTest.java"
        "src/android/net/wifi/cts/WifiNetworkSpecifierTest.java"
        "src/android/net/wifi/cts/WifiNetworkSuggestionTest.java"
        "src/android/net/wifi/nl80211/cts/DeviceWiphyCapabilitiesTest.java"
        "src/android/net/wifi/nl80211/cts/NativeScanResultTest.java"
        "src/android/net/wifi/nl80211/cts/NativeWifiClientTest.java"
        "src/android/net/wifi/nl80211/cts/PnoNetworkTest.java"
        "src/android/net/wifi/nl80211/cts/PnoSettingsTest.java"
        "src/android/net/wifi/nl80211/cts/RadioChainInfoTest.java"
        "src/android/net/wifi/nl80211/cts/WifiNl80211ManagerTest.java"
        "src/android/net/wifi/p2p/cts/WifiP2pConfigTest.java"
        "src/android/net/wifi/p2p/cts/WifiP2pDeviceTest.java"
        "src/android/net/wifi/p2p/cts/WifiP2pInfoTest.java"
        "src/android/net/wifi/p2p/cts/WifiP2pServiceRequestTest.java"
        "src/android/net/wifi/p2p/cts/WifiP2pWfdInfoTest.java"
        "src/android/net/wifi/rtt/cts/TestBase.java"
        "src/android/net/wifi/rtt/cts/WifiRttTest.java"
    ];

    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "junit"
        "junit-params"
        "truth-prebuilt"
    ];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "mts"
    ];

    data = [
        ":CtsWifiLocationTestApp"
    ];

    platform_apis = true;
};

in { inherit CtsWifiTestCases; }

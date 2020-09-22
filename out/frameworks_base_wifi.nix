{ filegroup, java_defaults, java_library, java_sdk_library }:
let

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

wifi-module-sdk-version-defaults = java_defaults {
    name = "wifi-module-sdk-version-defaults";
    min_sdk_version = "30";
    target_sdk_version = "30";
};

framework-wifi-updatable-exported-aidl-sources = filegroup {
    name = "framework-wifi-updatable-exported-aidl-sources";
    srcs = [
        "aidl-export/android/net/wifi/ScanResult.aidl"
        "aidl-export/android/net/wifi/SoftApCapability.aidl"
        "aidl-export/android/net/wifi/SoftApConfiguration.aidl"
        "aidl-export/android/net/wifi/SoftApInfo.aidl"
        "aidl-export/android/net/wifi/WifiClient.aidl"
        "aidl-export/android/net/wifi/WifiConfiguration.aidl"
        "aidl-export/android/net/wifi/WifiEnterpriseConfig.aidl"
        "aidl-export/android/net/wifi/WifiInfo.aidl"
        "aidl-export/android/net/wifi/WifiNetworkConnectionStatistics.aidl"
        "aidl-export/android/net/wifi/WifiNetworkSuggestion.aidl"
        "aidl-export/android/net/wifi/WifiUsabilityStatsEntry.aidl"
        "aidl-export/android/net/wifi/WpsInfo.aidl"
        "aidl-export/android/net/wifi/aware/Characteristics.aidl"
        "aidl-export/android/net/wifi/aware/PublishConfig.aidl"
        "aidl-export/android/net/wifi/aware/SubscribeConfig.aidl"
        "aidl-export/android/net/wifi/hotspot2/OsuProvider.aidl"
        "aidl-export/android/net/wifi/hotspot2/PasspointConfiguration.aidl"
        "aidl-export/android/net/wifi/hotspot2/pps/Credential.aidl"
        "aidl-export/android/net/wifi/hotspot2/pps/HomeSp.aidl"
        "aidl-export/android/net/wifi/p2p/WifiP2pConfig.aidl"
        "aidl-export/android/net/wifi/p2p/WifiP2pDevice.aidl"
        "aidl-export/android/net/wifi/p2p/WifiP2pDeviceList.aidl"
        "aidl-export/android/net/wifi/p2p/WifiP2pGroup.aidl"
        "aidl-export/android/net/wifi/p2p/WifiP2pInfo.aidl"
        "aidl-export/android/net/wifi/p2p/nsd/WifiP2pServiceInfo.aidl"
        "aidl-export/android/net/wifi/p2p/nsd/WifiP2pServiceRequest.aidl"
        "aidl-export/android/net/wifi/rtt/RangingRequest.aidl"
        "aidl-export/android/net/wifi/rtt/RangingResult.aidl"
        "aidl-export/android/net/wifi/rtt/ResponderConfig.aidl"
    ];
    path = "aidl-export";
    visibility = ["//visibility:private"];
};

framework-wifi-updatable-java-sources = filegroup {
    name = "framework-wifi-updatable-java-sources";
    srcs = [
        "java/android/net/wifi/AnqpInformationElement.java"
        "java/android/net/wifi/BatchedScanResult.java"
        "java/android/net/wifi/EAPConstants.java"
        "java/android/net/wifi/EasyConnectStatusCallback.java"
        "java/android/net/wifi/ParcelUtil.java"
        "java/android/net/wifi/RttManager.java"
        "java/android/net/wifi/ScanResult.java"
        "java/android/net/wifi/SoftApCapability.java"
        "java/android/net/wifi/SoftApConfToXmlMigrationUtil.java"
        "java/android/net/wifi/SoftApConfiguration.java"
        "java/android/net/wifi/SoftApInfo.java"
        "java/android/net/wifi/SupplicantState.java"
        "java/android/net/wifi/SynchronousExecutor.java"
        "java/android/net/wifi/WifiAnnotations.java"
        "java/android/net/wifi/WifiClient.java"
        "java/android/net/wifi/WifiConfiguration.java"
        "java/android/net/wifi/WifiEnterpriseConfig.java"
        "java/android/net/wifi/WifiFrameworkInitializer.java"
        "java/android/net/wifi/WifiInfo.java"
        "java/android/net/wifi/WifiManager.java"
        "java/android/net/wifi/WifiMigration.java"
        "java/android/net/wifi/WifiNetworkAgentSpecifier.java"
        "java/android/net/wifi/WifiNetworkConnectionStatistics.java"
        "java/android/net/wifi/WifiNetworkScoreCache.java"
        "java/android/net/wifi/WifiNetworkSpecifier.java"
        "java/android/net/wifi/WifiNetworkSuggestion.java"
        "java/android/net/wifi/WifiScanner.java"
        "java/android/net/wifi/WifiSsid.java"
        "java/android/net/wifi/WifiUsabilityStatsEntry.java"
        "java/android/net/wifi/WpsInfo.java"
        "java/android/net/wifi/aware/AttachCallback.java"
        "java/android/net/wifi/aware/Characteristics.java"
        "java/android/net/wifi/aware/ConfigRequest.java"
        "java/android/net/wifi/aware/DiscoverySession.java"
        "java/android/net/wifi/aware/DiscoverySessionCallback.java"
        "java/android/net/wifi/aware/IdentityChangedListener.java"
        "java/android/net/wifi/aware/ParcelablePeerHandle.java"
        "java/android/net/wifi/aware/PeerHandle.java"
        "java/android/net/wifi/aware/PublishConfig.java"
        "java/android/net/wifi/aware/PublishDiscoverySession.java"
        "java/android/net/wifi/aware/SubscribeConfig.java"
        "java/android/net/wifi/aware/SubscribeDiscoverySession.java"
        "java/android/net/wifi/aware/TlvBufferUtils.java"
        "java/android/net/wifi/aware/WifiAwareAgentNetworkSpecifier.java"
        "java/android/net/wifi/aware/WifiAwareManager.java"
        "java/android/net/wifi/aware/WifiAwareNetworkInfo.java"
        "java/android/net/wifi/aware/WifiAwareNetworkSpecifier.java"
        "java/android/net/wifi/aware/WifiAwareSession.java"
        "java/android/net/wifi/aware/WifiAwareUtils.java"
        "java/android/net/wifi/hotspot2/ConfigParser.java"
        "java/android/net/wifi/hotspot2/OsuProvider.java"
        "java/android/net/wifi/hotspot2/PasspointConfiguration.java"
        "java/android/net/wifi/hotspot2/ProvisioningCallback.java"
        "java/android/net/wifi/hotspot2/omadm/PpsMoParser.java"
        "java/android/net/wifi/hotspot2/omadm/XMLNode.java"
        "java/android/net/wifi/hotspot2/omadm/XMLParser.java"
        "java/android/net/wifi/hotspot2/pps/Credential.java"
        "java/android/net/wifi/hotspot2/pps/HomeSp.java"
        "java/android/net/wifi/hotspot2/pps/Policy.java"
        "java/android/net/wifi/hotspot2/pps/UpdateParameter.java"
        "java/android/net/wifi/nl80211/ChannelSettings.java"
        "java/android/net/wifi/nl80211/DeviceWiphyCapabilities.java"
        "java/android/net/wifi/nl80211/HiddenNetwork.java"
        "java/android/net/wifi/nl80211/NativeScanResult.java"
        "java/android/net/wifi/nl80211/NativeWifiClient.java"
        "java/android/net/wifi/nl80211/PnoNetwork.java"
        "java/android/net/wifi/nl80211/PnoSettings.java"
        "java/android/net/wifi/nl80211/RadioChainInfo.java"
        "java/android/net/wifi/nl80211/SingleScanSettings.java"
        "java/android/net/wifi/nl80211/WifiNl80211Manager.java"
        "java/android/net/wifi/p2p/WifiP2pConfig.java"
        "java/android/net/wifi/p2p/WifiP2pDevice.java"
        "java/android/net/wifi/p2p/WifiP2pDeviceList.java"
        "java/android/net/wifi/p2p/WifiP2pGroup.java"
        "java/android/net/wifi/p2p/WifiP2pGroupList.java"
        "java/android/net/wifi/p2p/WifiP2pInfo.java"
        "java/android/net/wifi/p2p/WifiP2pManager.java"
        "java/android/net/wifi/p2p/WifiP2pProvDiscEvent.java"
        "java/android/net/wifi/p2p/WifiP2pWfdInfo.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceInfo.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceRequest.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pDnsSdServiceResponse.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pServiceInfo.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pServiceRequest.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pServiceResponse.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pUpnpServiceInfo.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pUpnpServiceRequest.java"
        "java/android/net/wifi/p2p/nsd/WifiP2pUpnpServiceResponse.java"
        "java/android/net/wifi/rtt/CivicLocation.java"
        "java/android/net/wifi/rtt/CivicLocationKeys.java"
        "java/android/net/wifi/rtt/RangingRequest.java"
        "java/android/net/wifi/rtt/RangingResult.java"
        "java/android/net/wifi/rtt/RangingResultCallback.java"
        "java/android/net/wifi/rtt/ResponderConfig.java"
        "java/android/net/wifi/rtt/ResponderLocation.java"
        "java/android/net/wifi/rtt/WifiRttManager.java"
        "java/android/net/wifi/util/HexEncoding.java"
        "java/android/net/wifi/IActionListener.aidl"
        "java/android/net/wifi/IDppCallback.aidl"
        "java/android/net/wifi/ILocalOnlyHotspotCallback.aidl"
        "java/android/net/wifi/INetworkRequestMatchCallback.aidl"
        "java/android/net/wifi/INetworkRequestUserSelectionCallback.aidl"
        "java/android/net/wifi/IOnWifiActivityEnergyInfoListener.aidl"
        "java/android/net/wifi/IOnWifiUsabilityStatsListener.aidl"
        "java/android/net/wifi/IScanResultsCallback.aidl"
        "java/android/net/wifi/IScanResultsListener.aidl"
        "java/android/net/wifi/IScoreUpdateObserver.aidl"
        "java/android/net/wifi/ISoftApCallback.aidl"
        "java/android/net/wifi/ISuggestionConnectionStatusListener.aidl"
        "java/android/net/wifi/ITrafficStateCallback.aidl"
        "java/android/net/wifi/ITxPacketCountListener.aidl"
        "java/android/net/wifi/IWifiConnectedNetworkScorer.aidl"
        "java/android/net/wifi/IWifiManager.aidl"
        "java/android/net/wifi/IWifiScanner.aidl"
        "java/android/net/wifi/RttManager.aidl"
        "java/android/net/wifi/aware/ConfigRequest.aidl"
        "java/android/net/wifi/aware/IWifiAwareDiscoverySessionCallback.aidl"
        "java/android/net/wifi/aware/IWifiAwareEventCallback.aidl"
        "java/android/net/wifi/aware/IWifiAwareMacAddressProvider.aidl"
        "java/android/net/wifi/aware/IWifiAwareManager.aidl"
        "java/android/net/wifi/hotspot2/IProvisioningCallback.aidl"
        "java/android/net/wifi/p2p/IWifiP2pManager.aidl"
        "java/android/net/wifi/rtt/IRttCallback.aidl"
        "java/android/net/wifi/rtt/IWifiRttManager.aidl"
    ];
    exclude_srcs = [
        ":framework-wifi-non-updatable-sources"
    ];
    path = "java";
    visibility = ["//visibility:private"];
};

framework-wifi-updatable-sources = filegroup {
    name = "framework-wifi-updatable-sources";
    srcs = [
        ":framework-wifi-updatable-java-sources"
        ":framework-wifi-updatable-exported-aidl-sources"
    ];
};

framework-wifi-non-updatable-sources = filegroup {
    name = "framework-wifi-non-updatable-sources";
    srcs = [
        #  TODO(b/146011398) package android.net.wifi is now split amongst 2 jars: framework.jar and
        #  framework-wifi.jar. This is not a good idea, should move WifiNetworkScoreCache
        #  to a separate package.
        "java/android/net/wifi/SoftApConfToXmlMigrationUtil.java"
        "java/android/net/wifi/WifiNetworkScoreCache.java"
        "java/android/net/wifi/WifiMigration.java"
        "java/android/net/wifi/nl80211/ChannelSettings.java"
        "java/android/net/wifi/nl80211/DeviceWiphyCapabilities.java"
        "java/android/net/wifi/nl80211/HiddenNetwork.java"
        "java/android/net/wifi/nl80211/NativeScanResult.java"
        "java/android/net/wifi/nl80211/NativeWifiClient.java"
        "java/android/net/wifi/nl80211/PnoNetwork.java"
        "java/android/net/wifi/nl80211/PnoSettings.java"
        "java/android/net/wifi/nl80211/RadioChainInfo.java"
        "java/android/net/wifi/nl80211/SingleScanSettings.java"
        "java/android/net/wifi/nl80211/WifiNl80211Manager.java"
        ":libwificond_ipc_aidl"
    ];
};

framework-wifi-annotations = filegroup {
    name = "framework-wifi-annotations";
    srcs = ["java/android/net/wifi/WifiAnnotations.java"];
};

#  list of tests that are allowed to access @hide APIs from framework-wifi
test_access_hidden_api_whitelist = [
    "//frameworks/base/wifi/tests"
    "//frameworks/opt/net/wifi/tests/wifitests:__subpackages__"

    "//external/robolectric-shadows:__subpackages__"
    "//frameworks/base/packages/SettingsLib/tests/integ"
    "//external/sl4a:__subpackages__"
];

#  wifi-service needs pre-jarjared version of framework-wifi so it can reference copied utility
#  classes before they are renamed.
framework-wifi-pre-jarjar = java_library {
    name = "framework-wifi-pre-jarjar";
    defaults = ["wifi-module-sdk-version-defaults"];
    sdk_version = "module_current";
    static_libs = [
        "framework-wifi-util-lib"
        "android.hardware.wifi-V1.0-java-constants"
    ];
    libs = [
        "framework-annotations-lib"
        "unsupportedappusage" #  for android.compat.annotation.UnsupportedAppUsage
    ];
    srcs = [
        ":framework-wifi-updatable-sources"
        ":framework-wifi-util-lib-aidls"
    ];
    #  java_api_finder must accompany `srcs`
    plugins = ["java_api_finder"];
    installable = false;
    visibility = [
        "//frameworks/opt/net/wifi/service"
        "//frameworks/opt/net/wifi/tests/wifitests"
    ];
};

#  post-jarjar version of framework-wifi
framework-wifi = java_sdk_library {
    name = "framework-wifi";
    defaults = [
        "framework-module-defaults"
        "wifi-module-sdk-version-defaults"
    ];
    static_libs = [
        "framework-wifi-util-lib"
        "android.hardware.wifi-V1.0-java-constants"
    ];
    libs = [
        "unsupportedappusage" #  for android.compat.annotation.UnsupportedAppUsage
    ];
    srcs = [
        ":framework-wifi-updatable-sources"
        ":framework-wifi-util-lib-aidls"
    ];

    jarjar_rules = ":wifi-jarjar-rules";

    installable = true;
    optimize = {
        enabled = false;
    };
    hostdex = true; #  for hiddenapi check

    #  Allow access to the stubs from anywhere.
    visibility = ["//visibility:public"];

    #  Restrict access to implementation library.
    impl_library_visibility = [
        "//visibility:override" #  Ignore the visibility property.
        "//frameworks/opt/net/wifi/service:__subpackages__"
    ] ++ test_access_hidden_api_whitelist;

    apex_available = [
        "com.android.wifi"
        "test_com.android.wifi"
    ];
    permitted_packages = [
        "android.hardware.wifi"
        "android.net.wifi"
        #  Created by jarjar rules.
        "com.android.wifi.x"
    ];
};

#  defaults for tests that need to build against framework-wifi's @hide APIs
framework-wifi-test-defaults = java_defaults {
    name = "framework-wifi-test-defaults";
    sdk_version = "core_platform"; #  tests can use @CorePlatformApi's
    libs = [
        #  order matters: classes in framework-wifi are resolved before framework, meaning
        #  @hide APIs in framework-wifi are resolved before @SystemApi stubs in framework
        "framework-wifi.impl"
        "framework"

        #  if sdk_version="" this gets automatically included, but here we need to add manually.
        "framework-res"
    ];
    visibility = test_access_hidden_api_whitelist;
};

wifi-jarjar-rules = filegroup {
    name = "wifi-jarjar-rules";
    srcs = ["jarjar-rules.txt"];
};

in { inherit framework-wifi framework-wifi-annotations framework-wifi-non-updatable-sources framework-wifi-pre-jarjar framework-wifi-test-defaults framework-wifi-updatable-exported-aidl-sources framework-wifi-updatable-java-sources framework-wifi-updatable-sources wifi-jarjar-rules wifi-module-sdk-version-defaults; }

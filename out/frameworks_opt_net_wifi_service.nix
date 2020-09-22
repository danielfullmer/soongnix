{ android_app, android_app_certificate, filegroup, genrule, java_defaults, java_library, prebuilt_etc }:
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
wifi-service-common = java_defaults {
    name = "wifi-service-common";
    defaults = ["wifi-module-sdk-version-defaults"];
    errorprone = {
        javacflags = ["-Xep:CheckReturnValue:ERROR"];
    };
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

wifi-service-srcs = filegroup {
    name = "wifi-service-srcs";
    srcs = [
        "java/com/android/server/wifi/ActiveModeManager.java"
        "java/com/android/server/wifi/ActiveModeWarden.java"
        "java/com/android/server/wifi/AggressiveConnectedScore.java"
        "java/com/android/server/wifi/AvailableNetworkNotifier.java"
        "java/com/android/server/wifi/BackupManagerProxy.java"
        "java/com/android/server/wifi/BaseWifiDiagnostics.java"
        "java/com/android/server/wifi/BaseWifiService.java"
        "java/com/android/server/wifi/BssidBlocklistMonitor.java"
        "java/com/android/server/wifi/BubbleFunScorer.java"
        "java/com/android/server/wifi/BuildProperties.java"
        "java/com/android/server/wifi/ByteBufferReader.java"
        "java/com/android/server/wifi/ClientModeImpl.java"
        "java/com/android/server/wifi/ClientModeManager.java"
        "java/com/android/server/wifi/Clock.java"
        "java/com/android/server/wifi/CompatibilityScorer.java"
        "java/com/android/server/wifi/ConfigurationMap.java"
        "java/com/android/server/wifi/ConnectToNetworkNotificationBuilder.java"
        "java/com/android/server/wifi/ConnectedScore.java"
        "java/com/android/server/wifi/ConnectionFailureNotificationBuilder.java"
        "java/com/android/server/wifi/ConnectionFailureNotifier.java"
        "java/com/android/server/wifi/DefaultModeManager.java"
        "java/com/android/server/wifi/DeviceConfigFacade.java"
        "java/com/android/server/wifi/DppManager.java"
        "java/com/android/server/wifi/DppMetrics.java"
        "java/com/android/server/wifi/DummyLogMessage.java"
        "java/com/android/server/wifi/EapFailureNotifier.java"
        "java/com/android/server/wifi/ExtendedWifiInfo.java"
        "java/com/android/server/wifi/FakeWifiLog.java"
        "java/com/android/server/wifi/FrameworkFacade.java"
        "java/com/android/server/wifi/HalDeviceManager.java"
        "java/com/android/server/wifi/HostapdHal.java"
        "java/com/android/server/wifi/IMSIParameter.java"
        "java/com/android/server/wifi/ImsiPrivacyProtectionExemptionStoreData.java"
        "java/com/android/server/wifi/LastMileLogger.java"
        "java/com/android/server/wifi/LinkProbeManager.java"
        "java/com/android/server/wifi/LocalOnlyHotspotRequestInfo.java"
        "java/com/android/server/wifi/LogcatLog.java"
        "java/com/android/server/wifi/MacAddressUtil.java"
        "java/com/android/server/wifi/MboOceConstants.java"
        "java/com/android/server/wifi/MboOceController.java"
        "java/com/android/server/wifi/MemoryStoreImpl.java"
        "java/com/android/server/wifi/NetworkListSharedStoreData.java"
        "java/com/android/server/wifi/NetworkListStoreData.java"
        "java/com/android/server/wifi/NetworkListUserStoreData.java"
        "java/com/android/server/wifi/NetworkRequestStoreData.java"
        "java/com/android/server/wifi/NetworkSuggestionNominator.java"
        "java/com/android/server/wifi/NetworkSuggestionStoreData.java"
        "java/com/android/server/wifi/NetworkUpdateResult.java"
        "java/com/android/server/wifi/OpenNetworkNotifier.java"
        "java/com/android/server/wifi/PropertyService.java"
        "java/com/android/server/wifi/RandomizedMacStoreData.java"
        "java/com/android/server/wifi/SarInfo.java"
        "java/com/android/server/wifi/SarManager.java"
        "java/com/android/server/wifi/SavedNetworkNominator.java"
        "java/com/android/server/wifi/ScanDetail.java"
        "java/com/android/server/wifi/ScanDetailCache.java"
        "java/com/android/server/wifi/ScanRequestProxy.java"
        "java/com/android/server/wifi/ScanResultMatchInfo.java"
        "java/com/android/server/wifi/ScoreCardBasedScorer.java"
        "java/com/android/server/wifi/ScoredNetworkNominator.java"
        "java/com/android/server/wifi/ScoringParams.java"
        "java/com/android/server/wifi/SelfRecovery.java"
        "java/com/android/server/wifi/SimRequiredNotifier.java"
        "java/com/android/server/wifi/SoftApBackupRestore.java"
        "java/com/android/server/wifi/SoftApManager.java"
        "java/com/android/server/wifi/SoftApModeConfiguration.java"
        "java/com/android/server/wifi/SoftApNotifier.java"
        "java/com/android/server/wifi/SoftApStoreData.java"
        "java/com/android/server/wifi/SsidSetStoreData.java"
        "java/com/android/server/wifi/StateChangeResult.java"
        "java/com/android/server/wifi/SupplicantStaIfaceCallbackImpl.java"
        "java/com/android/server/wifi/SupplicantStaIfaceCallbackV1_1Impl.java"
        "java/com/android/server/wifi/SupplicantStaIfaceCallbackV1_2Impl.java"
        "java/com/android/server/wifi/SupplicantStaIfaceCallbackV1_3Impl.java"
        "java/com/android/server/wifi/SupplicantStaIfaceHal.java"
        "java/com/android/server/wifi/SupplicantStaNetworkHal.java"
        "java/com/android/server/wifi/SupplicantStateTracker.java"
        "java/com/android/server/wifi/SystemBuildProperties.java"
        "java/com/android/server/wifi/SystemPropertyService.java"
        "java/com/android/server/wifi/ThroughputPredictor.java"
        "java/com/android/server/wifi/ThroughputScorer.java"
        "java/com/android/server/wifi/UntrustedWifiNetworkFactory.java"
        "java/com/android/server/wifi/VelocityBasedConnectedScore.java"
        "java/com/android/server/wifi/WakeupConfigStoreData.java"
        "java/com/android/server/wifi/WakeupController.java"
        "java/com/android/server/wifi/WakeupEvaluator.java"
        "java/com/android/server/wifi/WakeupLock.java"
        "java/com/android/server/wifi/WakeupNotificationFactory.java"
        "java/com/android/server/wifi/WakeupOnboarding.java"
        "java/com/android/server/wifi/WifiApConfigStore.java"
        "java/com/android/server/wifi/WifiBackupDataParser.java"
        "java/com/android/server/wifi/WifiBackupDataV1Parser.java"
        "java/com/android/server/wifi/WifiBackupRestore.java"
        "java/com/android/server/wifi/WifiCandidates.java"
        "java/com/android/server/wifi/WifiCarrierInfoManager.java"
        "java/com/android/server/wifi/WifiChannelUtilization.java"
        "java/com/android/server/wifi/WifiConfigManager.java"
        "java/com/android/server/wifi/WifiConfigStore.java"
        "java/com/android/server/wifi/WifiConfigurationUtil.java"
        "java/com/android/server/wifi/WifiConnectivityHelper.java"
        "java/com/android/server/wifi/WifiConnectivityManager.java"
        "java/com/android/server/wifi/WifiContext.java"
        "java/com/android/server/wifi/WifiCountryCode.java"
        "java/com/android/server/wifi/WifiDataStall.java"
        "java/com/android/server/wifi/WifiDiagnostics.java"
        "java/com/android/server/wifi/WifiHealthMonitor.java"
        "java/com/android/server/wifi/WifiInjector.java"
        "java/com/android/server/wifi/WifiKeyStore.java"
        "java/com/android/server/wifi/WifiLastResortWatchdog.java"
        "java/com/android/server/wifi/WifiLinkLayerStats.java"
        "java/com/android/server/wifi/WifiLockManager.java"
        "java/com/android/server/wifi/WifiLog.java"
        "java/com/android/server/wifi/WifiLoggerHal.java"
        "java/com/android/server/wifi/WifiMetrics.java"
        "java/com/android/server/wifi/WifiMonitor.java"
        "java/com/android/server/wifi/WifiMulticastLockManager.java"
        "java/com/android/server/wifi/WifiNative.java"
        "java/com/android/server/wifi/WifiNetworkFactory.java"
        "java/com/android/server/wifi/WifiNetworkScoreCache.java"
        "java/com/android/server/wifi/WifiNetworkSelector.java"
        "java/com/android/server/wifi/WifiNetworkSuggestionsManager.java"
        "java/com/android/server/wifi/WifiPowerMetrics.java"
        "java/com/android/server/wifi/WifiScanAlwaysAvailableSettingsCompatibility.java"
        "java/com/android/server/wifi/WifiScoreCard.java"
        "java/com/android/server/wifi/WifiScoreReport.java"
        "java/com/android/server/wifi/WifiService.java"
        "java/com/android/server/wifi/WifiServiceImpl.java"
        "java/com/android/server/wifi/WifiSettingsConfigStore.java"
        "java/com/android/server/wifi/WifiSettingsStore.java"
        "java/com/android/server/wifi/WifiShellCommand.java"
        "java/com/android/server/wifi/WifiStateTracker.java"
        "java/com/android/server/wifi/WifiThreadRunner.java"
        "java/com/android/server/wifi/WifiTrafficPoller.java"
        "java/com/android/server/wifi/WifiVendorHal.java"
        "java/com/android/server/wifi/WifiWakeMetrics.java"
        "java/com/android/server/wifi/WlanWakeReasonAndCounts.java"
        "java/com/android/server/wifi/WrongPasswordNotifier.java"
        "java/com/android/server/wifi/aware/Capabilities.java"
        "java/com/android/server/wifi/aware/WifiAwareClientState.java"
        "java/com/android/server/wifi/aware/WifiAwareDataPathStateManager.java"
        "java/com/android/server/wifi/aware/WifiAwareDiscoverySessionState.java"
        "java/com/android/server/wifi/aware/WifiAwareMetrics.java"
        "java/com/android/server/wifi/aware/WifiAwareNativeApi.java"
        "java/com/android/server/wifi/aware/WifiAwareNativeCallback.java"
        "java/com/android/server/wifi/aware/WifiAwareNativeManager.java"
        "java/com/android/server/wifi/aware/WifiAwareService.java"
        "java/com/android/server/wifi/aware/WifiAwareServiceImpl.java"
        "java/com/android/server/wifi/aware/WifiAwareShellCommand.java"
        "java/com/android/server/wifi/aware/WifiAwareStateManager.java"
        "java/com/android/server/wifi/hotspot2/ANQPData.java"
        "java/com/android/server/wifi/hotspot2/ANQPMatcher.java"
        "java/com/android/server/wifi/hotspot2/ANQPNetworkKey.java"
        "java/com/android/server/wifi/hotspot2/ANQPRequestManager.java"
        "java/com/android/server/wifi/hotspot2/AnqpCache.java"
        "java/com/android/server/wifi/hotspot2/AnqpEvent.java"
        "java/com/android/server/wifi/hotspot2/DomainMatcher.java"
        "java/com/android/server/wifi/hotspot2/IconEvent.java"
        "java/com/android/server/wifi/hotspot2/LegacyPasspointConfig.java"
        "java/com/android/server/wifi/hotspot2/NetworkDetail.java"
        "java/com/android/server/wifi/hotspot2/OsuNetworkConnection.java"
        "java/com/android/server/wifi/hotspot2/OsuServerConnection.java"
        "java/com/android/server/wifi/hotspot2/PasspointConfigSharedStoreData.java"
        "java/com/android/server/wifi/hotspot2/PasspointConfigUserStoreData.java"
        "java/com/android/server/wifi/hotspot2/PasspointEventHandler.java"
        "java/com/android/server/wifi/hotspot2/PasspointManager.java"
        "java/com/android/server/wifi/hotspot2/PasspointMatch.java"
        "java/com/android/server/wifi/hotspot2/PasspointNetworkNominateHelper.java"
        "java/com/android/server/wifi/hotspot2/PasspointObjectFactory.java"
        "java/com/android/server/wifi/hotspot2/PasspointProvider.java"
        "java/com/android/server/wifi/hotspot2/PasspointProvisioner.java"
        "java/com/android/server/wifi/hotspot2/PasspointXmlUtils.java"
        "java/com/android/server/wifi/hotspot2/ServiceProviderVerifier.java"
        "java/com/android/server/wifi/hotspot2/SystemInfo.java"
        "java/com/android/server/wifi/hotspot2/Utils.java"
        "java/com/android/server/wifi/hotspot2/WfaCertBuilder.java"
        "java/com/android/server/wifi/hotspot2/WfaKeyStore.java"
        "java/com/android/server/wifi/hotspot2/WnmData.java"
        "java/com/android/server/wifi/hotspot2/anqp/ANQPElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/ANQPParser.java"
        "java/com/android/server/wifi/hotspot2/anqp/CellularNetwork.java"
        "java/com/android/server/wifi/hotspot2/anqp/Constants.java"
        "java/com/android/server/wifi/hotspot2/anqp/DomainNameElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/GenericBlobElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/HSConnectionCapabilityElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/HSFriendlyNameElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/HSIconFileElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/HSOsuProvidersElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/HSWanMetricsElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/I18Name.java"
        "java/com/android/server/wifi/hotspot2/anqp/IPAddressTypeAvailabilityElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/IconInfo.java"
        "java/com/android/server/wifi/hotspot2/anqp/NAIRealmData.java"
        "java/com/android/server/wifi/hotspot2/anqp/NAIRealmElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/OsuProviderInfo.java"
        "java/com/android/server/wifi/hotspot2/anqp/ProtocolPortTuple.java"
        "java/com/android/server/wifi/hotspot2/anqp/RawByteElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/RoamingConsortiumElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/ThreeGPPNetworkElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/VenueNameElement.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/AuthParam.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/CredentialType.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/EAPMethod.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/ExpandedEAPMethod.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/InnerAuthEAP.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/NonEAPInnerAuth.java"
        "java/com/android/server/wifi/hotspot2/anqp/eap/VendorSpecificAuth.java"
        "java/com/android/server/wifi/hotspot2/omadm/DevDetailMo.java"
        "java/com/android/server/wifi/hotspot2/omadm/DevInfoMo.java"
        "java/com/android/server/wifi/hotspot2/omadm/MoSerializer.java"
        "java/com/android/server/wifi/hotspot2/soap/ExchangeCompleteMessage.java"
        "java/com/android/server/wifi/hotspot2/soap/HttpsServiceConnection.java"
        "java/com/android/server/wifi/hotspot2/soap/HttpsTransport.java"
        "java/com/android/server/wifi/hotspot2/soap/PostDevDataMessage.java"
        "java/com/android/server/wifi/hotspot2/soap/PostDevDataResponse.java"
        "java/com/android/server/wifi/hotspot2/soap/RedirectListener.java"
        "java/com/android/server/wifi/hotspot2/soap/SoapParser.java"
        "java/com/android/server/wifi/hotspot2/soap/SppConstants.java"
        "java/com/android/server/wifi/hotspot2/soap/SppResponseMessage.java"
        "java/com/android/server/wifi/hotspot2/soap/UpdateResponseMessage.java"
        "java/com/android/server/wifi/hotspot2/soap/command/BrowserUri.java"
        "java/com/android/server/wifi/hotspot2/soap/command/PpsMoData.java"
        "java/com/android/server/wifi/hotspot2/soap/command/SppCommand.java"
        "java/com/android/server/wifi/p2p/SupplicantP2pIfaceCallback.java"
        "java/com/android/server/wifi/p2p/SupplicantP2pIfaceHal.java"
        "java/com/android/server/wifi/p2p/WifiP2pMetrics.java"
        "java/com/android/server/wifi/p2p/WifiP2pMonitor.java"
        "java/com/android/server/wifi/p2p/WifiP2pNative.java"
        "java/com/android/server/wifi/p2p/WifiP2pService.java"
        "java/com/android/server/wifi/p2p/WifiP2pServiceImpl.java"
        "java/com/android/server/wifi/rtt/RttMetrics.java"
        "java/com/android/server/wifi/rtt/RttNative.java"
        "java/com/android/server/wifi/rtt/RttService.java"
        "java/com/android/server/wifi/rtt/RttServiceImpl.java"
        "java/com/android/server/wifi/scanner/BackgroundScanScheduler.java"
        "java/com/android/server/wifi/scanner/ChannelHelper.java"
        "java/com/android/server/wifi/scanner/HalWifiScannerImpl.java"
        "java/com/android/server/wifi/scanner/KnownBandsChannelHelper.java"
        "java/com/android/server/wifi/scanner/PresetKnownBandsChannelHelper.java"
        "java/com/android/server/wifi/scanner/ScanScheduleUtil.java"
        "java/com/android/server/wifi/scanner/WifiScannerImpl.java"
        "java/com/android/server/wifi/scanner/WifiScanningService.java"
        "java/com/android/server/wifi/scanner/WifiScanningServiceImpl.java"
        "java/com/android/server/wifi/scanner/WificondChannelHelper.java"
        "java/com/android/server/wifi/scanner/WificondScannerImpl.java"
        "java/com/android/server/wifi/util/ApConfigUtil.java"
        "java/com/android/server/wifi/util/ArrayUtils.java"
        "java/com/android/server/wifi/util/BitMask.java"
        "java/com/android/server/wifi/util/ByteArrayRingBuffer.java"
        "java/com/android/server/wifi/util/EncryptedData.java"
        "java/com/android/server/wifi/util/Environment.java"
        "java/com/android/server/wifi/util/ExternalCallbackTracker.java"
        "java/com/android/server/wifi/util/FileUtils.java"
        "java/com/android/server/wifi/util/FrameParser.java"
        "java/com/android/server/wifi/util/GeneralUtil.java"
        "java/com/android/server/wifi/util/InformationElementUtil.java"
        "java/com/android/server/wifi/util/IntCounter.java"
        "java/com/android/server/wifi/util/IntHistogram.java"
        "java/com/android/server/wifi/util/IpConfigStore.java"
        "java/com/android/server/wifi/util/KalmanFilter.java"
        "java/com/android/server/wifi/util/KeyValueListParser.java"
        "java/com/android/server/wifi/util/LruConnectionTracker.java"
        "java/com/android/server/wifi/util/LruList.java"
        "java/com/android/server/wifi/util/Matrix.java"
        "java/com/android/server/wifi/util/MetricsUtils.java"
        "java/com/android/server/wifi/util/MissingCounterTimerLockList.java"
        "java/com/android/server/wifi/util/NativeUtil.java"
        "java/com/android/server/wifi/util/NetdWrapper.java"
        "java/com/android/server/wifi/util/ObjectCounter.java"
        "java/com/android/server/wifi/util/RssiUtil.java"
        "java/com/android/server/wifi/util/ScanResultUtil.java"
        "java/com/android/server/wifi/util/SettingsMigrationDataHolder.java"
        "java/com/android/server/wifi/util/StringUtil.java"
        "java/com/android/server/wifi/util/TimedQuotaManager.java"
        "java/com/android/server/wifi/util/WifiAsyncChannel.java"
        "java/com/android/server/wifi/util/WifiConfigStoreEncryptionUtil.java"
        "java/com/android/server/wifi/util/WifiHandler.java"
        "java/com/android/server/wifi/util/WifiPermissionsUtil.java"
        "java/com/android/server/wifi/util/WifiPermissionsWrapper.java"
        "java/com/android/server/wifi/util/WorkSourceUtil.java"
        "java/com/android/server/wifi/util/XmlUtil.java"
        "java/com/android/server/wifi/util/XmlUtilHelper.java"

        ":framework-wifi-service-shared-srcs"
        ":net-utils-wifi-service-common-srcs"
        ":statslog-wifi-java-gen"
    ];
};

wifi-service-BaseWifiService = filegroup {
    name = "wifi-service-BaseWifiService";
    srcs = ["java/com/android/server/wifi/BaseWifiService.java"];
    path = "java";
};

#  pre-jarjar version of wifi-service that builds against pre-jarjar version of framework-wifi
wifi-service-pre-jarjar = java_library {
    name = "wifi-service-pre-jarjar";
    installable = false;
    defaults = ["wifi-service-common"];
    srcs = [":wifi-service-srcs"];
    #  java_api_finder must accompany `srcs`
    plugins = ["java_api_finder"];

    sdk_version = "system_server_current";
    libs = [
        "error_prone_annotations"
        "jsr305"
        "framework-annotations-lib"
        #  load the resources from the resources APK.
        "ServiceWifiResources"
        #  need pre-jarjar symbols so that wifi-service can reference the original class names at
        #  compile time
        "framework-wifi-pre-jarjar"
        "framework-statsd.stubs.module_lib"
        "framework-tethering.stubs.module_lib"
        "unsupportedappusage"
    ];

    static_libs = [
        "android.hardware.wifi-V1.0-java"
        "android.hardware.wifi-V1.1-java"
        "android.hardware.wifi-V1.2-java"
        "android.hardware.wifi-V1.3-java"
        "android.hardware.wifi-V1.4-java"
        "android.hardware.wifi.hostapd-V1.0-java"
        "android.hardware.wifi.hostapd-V1.1-java"
        "android.hardware.wifi.hostapd-V1.2-java"
        "android.hardware.wifi.supplicant-V1.0-java"
        "android.hardware.wifi.supplicant-V1.1-java"
        "android.hardware.wifi.supplicant-V1.2-java"
        "android.hardware.wifi.supplicant-V1.3-java"
        "android.hidl.manager-V1.2-java"
        "androidx.annotation_annotation"
        "bouncycastle-unbundled"
        "ksoap2"
        #  Note: libprotobuf-java-lite uses a few core platform APIs which
        #  does show up as @hide API usage. But, this can be safely ignored
        #  since the library uses reflection to ensure that the OS does provide
        #  the necessary core platform APIs.
        "libprotobuf-java-lite"
        "libnanohttpd"
        "services.net-module-wifi"
        "wifi-lite-protos"
        "wifi-nano-protos"
    ];
};

#  wifi-service static library
#  ============================================================
service-wifi = java_library {
    name = "service-wifi";
    defaults = ["wifi-service-common"];
    installable = true;
    static_libs = ["wifi-service-pre-jarjar"];

    #  need to include `libs` so that Soong doesn't complain about missing classes after jarjaring
    libs = [
        "framework-wifi.impl"
    ];

    sdk_version = "system_server_current";

    jarjar_rules = ":wifi-jarjar-rules";
    optimize = {
        enabled = true;
        shrink = true;
        proguard_flags_files = ["proguard.flags"];
    };
    dex_preopt = {
        enabled = false;
        app_image = false;
    };

    visibility = [
        "//frameworks/opt/net/wifi/service/apex"
        "//frameworks/opt/net/wifi/tests/wifitests/apex"
    ];
    apex_available = [
        "com.android.wifi"
        "test_com.android.wifi"
    ];
};

#  Statsd auto-generated code
#  ============================================================
statslog-wifi-java-gen = genrule {
    name = "statslog-wifi-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module wifi " +
        " --javaPackage com.android.server.wifi.proto --javaClass WifiStatsLog";
    out = ["com/android/server/wifi/proto/WifiStatsLog.java"];
};

#  APK to hold all the wifi overlayable resources.
#  ============================================================
ServiceWifiResources = android_app {
    name = "ServiceWifiResources";
    defaults = ["wifi-service-common"];
    resource_dirs = [
        "res"
    ];
    privileged = true;
    sdk_version = "system_current";
    export_package_resources = true;
    manifest = "AndroidManifest_Resources.xml";
    apex_available = [
        "com.android.wifi"
        "test_com.android.wifi"
    ];
    certificate = ":com.android.wifi.resources.certificate";
};

"com.android.wifi.resources.certificate" = android_app_certificate {
    name = "com.android.wifi.resources.certificate";
    certificate = "resources-certs/com.android.wifi.resources";
};

#  Prebuilt for the wifi.rc file.
"wifi.rc" = prebuilt_etc {
    name = "wifi.rc";
    src = "wifi.rc";
    sub_dir = "init";
};

in { inherit "com.android.wifi.resources.certificate" "wifi.rc" ServiceWifiResources service-wifi statslog-wifi-java-gen wifi-service-BaseWifiService wifi-service-common wifi-service-pre-jarjar wifi-service-srcs; }

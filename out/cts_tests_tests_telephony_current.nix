{ android_test, filegroup }:
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

telephony-cts-ims-common-srcs = filegroup {
    name = "telephony-cts-ims-common-srcs";
    srcs = [
        "src/android/telephony/ims/cts/TestImsService.java"
        "src/android/telephony/ims/cts/TestRcsFeature.java"
        "src/android/telephony/ims/cts/TestMmTelFeature.java"
        "src/android/telephony/ims/cts/TestImsSmsImpl.java"
        "src/android/telephony/ims/cts/TestImsConfig.java"
        "src/android/telephony/ims/cts/ImsUtils.java"
    ];
    path = "src/";
};

CtsTelephonyTestCases = android_test {
    name = "CtsTelephonyTestCases";
    defaults = ["cts_defaults"];
    libs = [
        "telephony-common"
        "android.test.runner.stubs"
        "android.test.base.stubs"
        "voip-common"
    ];
    #  uncomment when EuiccService tests do not use hidden APIs (Binder instances)
    # sdk_version: "test_current",
    static_libs = [
        "androidx.test.ext.junit"
        "ctstestrunner-axt"
        "hamcrest-library"
        "compatibility-device-util-axt"
        "truth-prebuilt"
    ];
    srcs = [
        "src/android/telephony/cts/ApnSettingTest.java"
        "src/android/telephony/cts/AsyncSmsMessageListener.java"
        "src/android/telephony/cts/AvailableNetworkInfoTest.java"
        "src/android/telephony/cts/BatteryStatsManagerTest.java"
        "src/android/telephony/cts/CarrierCapability.java"
        "src/android/telephony/cts/CarrierConfigManagerTest.java"
        "src/android/telephony/cts/CarrierServiceTest.java"
        "src/android/telephony/cts/CbGeoUtilsTest.java"
        "src/android/telephony/cts/CdmaSmsCbProgramDataTest.java"
        "src/android/telephony/cts/CellBroadcastDataMigrationTest.java"
        "src/android/telephony/cts/CellBroadcastIntentsTest.java"
        "src/android/telephony/cts/CellBroadcastServiceTest.java"
        "src/android/telephony/cts/CellIdentityTest.java"
        "src/android/telephony/cts/CellInfoTest.java"
        "src/android/telephony/cts/CellLocationTest.java"
        "src/android/telephony/cts/CellSignalStrengthTest.java"
        "src/android/telephony/cts/ComposeSmsActivity.java"
        "src/android/telephony/cts/DataCallResponseTest.java"
        "src/android/telephony/cts/DataProfileTest.java"
        "src/android/telephony/cts/HeadlessSmsSendService.java"
        "src/android/telephony/cts/ImsiEncryptionInfoTest.java"
        "src/android/telephony/cts/IwlanModeTest.java"
        "src/android/telephony/cts/LteVopsSupportInfoTest.java"
        "src/android/telephony/cts/MmsPduProvider.java"
        "src/android/telephony/cts/MmsReceiver.java"
        "src/android/telephony/cts/MmsTest.java"
        "src/android/telephony/cts/MockVisualVoicemailService.java"
        "src/android/telephony/cts/NeighboringCellInfoTest.java"
        "src/android/telephony/cts/NetworkRegistrationInfoTest.java"
        "src/android/telephony/cts/NetworkServiceTest.java"
        "src/android/telephony/cts/PermissionlessVisualVoicemailService.java"
        "src/android/telephony/cts/PhoneNumberUtilsTest.java"
        "src/android/telephony/cts/PhoneStateListenerTest.java"
        "src/android/telephony/cts/RadioAccessSpecifierTest.java"
        "src/android/telephony/cts/ServiceStateTest.java"
        "src/android/telephony/cts/SignalStrengthTest.java"
        "src/android/telephony/cts/SipAudioCallTest.java"
        "src/android/telephony/cts/SipManagerTest.java"
        "src/android/telephony/cts/SipProfileTest.java"
        "src/android/telephony/cts/SmsCbCmasInfoTest.java"
        "src/android/telephony/cts/SmsCbEtwsInfoTest.java"
        "src/android/telephony/cts/SmsCbLocationTest.java"
        "src/android/telephony/cts/SmsCbMessageTest.java"
        "src/android/telephony/cts/SmsManagerTest.java"
        "src/android/telephony/cts/SmsMessageTest.java"
        "src/android/telephony/cts/SmsMessage_MessageClassTest.java"
        "src/android/telephony/cts/SmsMessage_SubmitPduTest.java"
        "src/android/telephony/cts/SmsReceiver.java"
        "src/android/telephony/cts/SmsReceiverHelper.java"
        "src/android/telephony/cts/SmsUsageMonitorShortCodeTest.java"
        "src/android/telephony/cts/StubDialerActivity.java"
        "src/android/telephony/cts/StubInCallService.java"
        "src/android/telephony/cts/SubscriptionManagerTest.java"
        "src/android/telephony/cts/TelephonyDisplayInfoTest.java"
        "src/android/telephony/cts/TelephonyLocationTests.java"
        "src/android/telephony/cts/TelephonyManagerTest.java"
        "src/android/telephony/cts/TelephonyProtectedBroadcastsTest.java"
        "src/android/telephony/cts/TelephonyRegistryManagerTest.java"
        "src/android/telephony/cts/TelephonyUtils.java"
        "src/android/telephony/cts/VisualVoicemailServiceTest.java"
        "src/android/telephony/embms/cts/DownloadRequestTest.java"
        "src/android/telephony/embms/cts/MbmsDownloadCallbackTest.java"
        "src/android/telephony/embms/cts/MbmsDownloadFlowTest.java"
        "src/android/telephony/embms/cts/MbmsDownloadReceiverTest.java"
        "src/android/telephony/embms/cts/MbmsDownloadSessionTest.java"
        "src/android/telephony/embms/cts/MbmsDownloadTestBase.java"
        "src/android/telephony/embms/cts/MbmsGroupCallSessionTest.java"
        "src/android/telephony/embms/cts/MbmsGroupCallTest.java"
        "src/android/telephony/embms/cts/MbmsGroupCallTestBase.java"
        "src/android/telephony/embms/cts/MbmsStreamingServiceTest.java"
        "src/android/telephony/embms/cts/MbmsStreamingSessionTest.java"
        "src/android/telephony/embms/cts/MbmsStreamingTestBase.java"
        "src/android/telephony/embms/cts/ServiceInfoTest.java"
        "src/android/telephony/embms/cts/SomeArgs.java"
        "src/android/telephony/euicc/cts/DownloadableSubscriptionTest.java"
        "src/android/telephony/euicc/cts/EuiccInfoTest.java"
        "src/android/telephony/euicc/cts/EuiccManagerTest.java"
        "src/android/telephony/euicc/cts/EuiccProfileInfoTest.java"
        "src/android/telephony/euicc/cts/EuiccResolutionActivity.java"
        "src/android/telephony/euicc/cts/EuiccServiceTest.java"
        "src/android/telephony/euicc/cts/EuiccTestResolutionActivity.java"
        "src/android/telephony/euicc/cts/GetDefaultDownloadableSubscriptionListResultTest.java"
        "src/android/telephony/euicc/cts/GetDownloadableSubscriptionMetadataResultTest.java"
        "src/android/telephony/euicc/cts/GetEuiccProfileInfoListResultTest.java"
        "src/android/telephony/euicc/cts/MockEuiccService.java"
        "src/android/telephony/gsm/cts/GsmCellLocationTest.java"
        "src/android/telephony/gsm/cts/SmsMessage_MessageClassTest.java"
        "src/android/telephony/ims/cts/ImsCallForwardInfoTest.java"
        "src/android/telephony/ims/cts/ImsCallProfileTest.java"
        "src/android/telephony/ims/cts/ImsExceptionTest.java"
        "src/android/telephony/ims/cts/ImsExternalCallStateTest.java"
        "src/android/telephony/ims/cts/ImsMmTelManagerTest.java"
        "src/android/telephony/ims/cts/ImsReasonInfoTest.java"
        "src/android/telephony/ims/cts/ImsServiceConnector.java"
        "src/android/telephony/ims/cts/ImsServiceTest.java"
        "src/android/telephony/ims/cts/ImsSsDataTest.java"
        "src/android/telephony/ims/cts/ImsSsInfoTest.java"
        "src/android/telephony/ims/cts/ImsStreamMediaProfileTest.java"
        "src/android/telephony/ims/cts/ImsSuppServiceNotificationTest.java"
        "src/android/telephony/ims/cts/ImsUtils.java"
        "src/android/telephony/ims/cts/RcsContactUceCapabilityTest.java"
        "src/android/telephony/ims/cts/RcsUceAdapterTest.java"
        "src/android/telephony/ims/cts/TestImsConfig.java"
        "src/android/telephony/ims/cts/TestImsService.java"
        "src/android/telephony/ims/cts/TestImsSmsImpl.java"
        "src/android/telephony/ims/cts/TestMmTelFeature.java"
        "src/android/telephony/ims/cts/TestRcsFeature.java"
        "EmbmsMiddlewareTestApp/src/android/telephony/cts/embmstestapp/CtsDownloadService.java"
        "EmbmsMiddlewareTestApp/src/android/telephony/cts/embmstestapp/CtsGroupCallService.java"
        "EmbmsMiddlewareTestApp/src/android/telephony/cts/embmstestapp/CtsStreamingService.java"
        "EmbmsMiddlewareTestApp/aidl/android/telephony/cts/embmstestapp/ICtsDownloadMiddlewareControl.aidl"
        "EmbmsMiddlewareTestApp/aidl/android/telephony/cts/embmstestapp/ICtsGroupCallMiddlewareControl.aidl"
        "EmbmsMiddlewareTestApp/aidl/android/telephony/cts/embmstestapp/ICtsStreamingMiddlewareControl.aidl"
        "LocationAccessingApp/src/android/telephony/cts/locationaccessingapp/CtsLocationAccessService.java"
        "LocationAccessingApp/aidl/android/telephony/cts/locationaccessingapp/ICtsLocationAccessControl.aidl"
        "TestExternalImsServiceApp/src/android/telephony/cts/externalimsservice/TestExternalImsService.java"
        "TestExternalImsServiceApp/aidl/android/telephony/cts/externalimsservice/ITestExternalImsService.aidl"
    ];
    aidl = {
        local_include_dirs = [
            "EmbmsMiddlewareTestApp/aidl/"
            "TestExternalImsServiceApp/aidl/"
        ];
    };
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    platform_apis = true;
    host_required = [
        "compatibility-host-telephony-preconditions"
        "cts-tradefed"
    ];
};

in { inherit CtsTelephonyTestCases telephony-cts-ims-common-srcs; }

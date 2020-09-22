{ android_app }:
let

#  Copyright 2019 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Build the Phone app which includes the emergency dialer. See Contacts
#  for the 'other' dialer.

TeleService = android_app {
    name = "TeleService";

    libs = [
        "telephony-common"
        "voip-common"
        "ims-common"
        "libprotobuf-java-lite"
        "unsupportedappusage"
    ];

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx.legacy_legacy-preference-v14"
        "android-support-annotations"
        "com.android.phone.common-lib"
        "guava"
        "PlatformProperties"
    ];

    srcs = [
        ":framework-telephony-common-shared-srcs"
        "src/com/android/phone/ADNList.java"
        "src/com/android/phone/Assert.java"
        "src/com/android/phone/CLIRListPreference.java"
        "src/com/android/phone/CallBarringDeselectAllPreference.java"
        "src/com/android/phone/CallBarringEditPreference.java"
        "src/com/android/phone/CallFeaturesSetting.java"
        "src/com/android/phone/CallForwardEditPreference.java"
        "src/com/android/phone/CallGatewayManager.java"
        "src/com/android/phone/CallNotifier.java"
        "src/com/android/phone/CallTime.java"
        "src/com/android/phone/CallWaitingSwitchPreference.java"
        "src/com/android/phone/CallerInfoCache.java"
        "src/com/android/phone/CarrierConfigLoader.java"
        "src/com/android/phone/CarrierLogo.java"
        "src/com/android/phone/CarrierXmlParser.java"
        "src/com/android/phone/CdmaCallOptions.java"
        "src/com/android/phone/CdmaPhoneCallState.java"
        "src/com/android/phone/CdmaVoicePrivacySwitchPreference.java"
        "src/com/android/phone/CellInfoUtil.java"
        "src/com/android/phone/ChangeIccPinScreen.java"
        "src/com/android/phone/Constants.java"
        "src/com/android/phone/DumpsysHandler.java"
        "src/com/android/phone/EccShortcutAdapter.java"
        "src/com/android/phone/EditPhoneNumberPreference.java"
        "src/com/android/phone/EmergencyActionGroup.java"
        "src/com/android/phone/EmergencyAssistanceHelper.java"
        "src/com/android/phone/EmergencyCallbackModeExitDialog.java"
        "src/com/android/phone/EmergencyCallbackModeService.java"
        "src/com/android/phone/EmergencyDialer.java"
        "src/com/android/phone/EmergencyInfoGroup.java"
        "src/com/android/phone/EmergencyShortcutButton.java"
        "src/com/android/phone/EnableIccPinScreen.java"
        "src/com/android/phone/FakePhoneActivity.java"
        "src/com/android/phone/GsmUmtsAdditionalCallOptions.java"
        "src/com/android/phone/GsmUmtsCallBarringOptions.java"
        "src/com/android/phone/GsmUmtsCallForwardOptions.java"
        "src/com/android/phone/GsmUmtsCallOptions.java"
        "src/com/android/phone/IccNetworkDepersonalizationPanel.java"
        "src/com/android/phone/IccPanel.java"
        "src/com/android/phone/IccProvider.java"
        "src/com/android/phone/ImsRcsController.java"
        "src/com/android/phone/ImsUtil.java"
        "src/com/android/phone/InCallScreen.java"
        "src/com/android/phone/MMIDialogActivity.java"
        "src/com/android/phone/NeededForTesting.java"
        "src/com/android/phone/NotificationMgr.java"
        "src/com/android/phone/NumberVerificationManager.java"
        "src/com/android/phone/PhoneApp.java"
        "src/com/android/phone/PhoneDisplayMessage.java"
        "src/com/android/phone/PhoneGlobals.java"
        "src/com/android/phone/PhoneInterfaceManager.java"
        "src/com/android/phone/PhoneUtils.java"
        "src/com/android/phone/Profiler.java"
        "src/com/android/phone/ServiceStateProvider.java"
        "src/com/android/phone/ShortcutViewUtils.java"
        "src/com/android/phone/SimContacts.java"
        "src/com/android/phone/SpecialCharSequenceMgr.java"
        "src/com/android/phone/SubscriptionInfoHelper.java"
        "src/com/android/phone/TelephonyDebugService.java"
        "src/com/android/phone/TelephonyShellCommand.java"
        "src/com/android/phone/TimeConsumingPreferenceActivity.java"
        "src/com/android/phone/euicc/EuiccPrivilegedActionUiDispatcherActivity.java"
        "src/com/android/phone/euicc/EuiccPublicActionUiDispatcherActivity.java"
        "src/com/android/phone/euicc/EuiccResolutionUiDispatcherActivity.java"
        "src/com/android/phone/euicc/EuiccUiDispatcherActivity.java"
        "src/com/android/phone/otasp/OtaspActivationService.java"
        "src/com/android/phone/otasp/OtaspSimStateReceiver.java"
        "src/com/android/phone/settings/AccessibilitySettingsActivity.java"
        "src/com/android/phone/settings/AccessibilitySettingsFragment.java"
        "src/com/android/phone/settings/AccountSelectionPreference.java"
        "src/com/android/phone/settings/BandMode.java"
        "src/com/android/phone/settings/CallForwardInfoUtil.java"
        "src/com/android/phone/settings/PhoneAccountSettingsActivity.java"
        "src/com/android/phone/settings/PhoneAccountSettingsFragment.java"
        "src/com/android/phone/settings/PickSmsSubscriptionActivity.java"
        "src/com/android/phone/settings/RadioInfo.java"
        "src/com/android/phone/settings/SettingsConstants.java"
        "src/com/android/phone/settings/SuppServicesUiUtil.java"
        "src/com/android/phone/settings/TextViewPreference.java"
        "src/com/android/phone/settings/TtyModeListPreference.java"
        "src/com/android/phone/settings/VoicemailDialogUtil.java"
        "src/com/android/phone/settings/VoicemailProviderListPreference.java"
        "src/com/android/phone/settings/VoicemailProviderSettings.java"
        "src/com/android/phone/settings/VoicemailProviderSettingsUtil.java"
        "src/com/android/phone/settings/VoicemailSettingsActivity.java"
        "src/com/android/phone/settings/fdn/DeleteFdnContactScreen.java"
        "src/com/android/phone/settings/fdn/EditFdnContactScreen.java"
        "src/com/android/phone/settings/fdn/EditPinPreference.java"
        "src/com/android/phone/settings/fdn/FdnList.java"
        "src/com/android/phone/settings/fdn/FdnSetting.java"
        "src/com/android/phone/settings/fdn/GetPin2Screen.java"
        "src/com/android/phone/vvm/CarrierVvmPackageInstalledReceiver.java"
        "src/com/android/phone/vvm/PhoneAccountHandleConverter.java"
        "src/com/android/phone/vvm/RemoteVvmTaskManager.java"
        "src/com/android/phone/vvm/VisualVoicemailPreferences.java"
        "src/com/android/phone/vvm/VisualVoicemailSettingsUtil.java"
        "src/com/android/phone/vvm/VisualVoicemailSmsFilterConfig.java"
        "src/com/android/phone/vvm/VvmDumpHandler.java"
        "src/com/android/phone/vvm/VvmLog.java"
        "src/com/android/phone/vvm/VvmSimStateTracker.java"
        "src/com/android/phone/vvm/VvmSmsReceiver.java"
        "src/com/android/services/telephony/CdmaConference.java"
        "src/com/android/services/telephony/CdmaConferenceController.java"
        "src/com/android/services/telephony/CdmaConnection.java"
        "src/com/android/services/telephony/ConferenceParticipantConnection.java"
        "src/com/android/services/telephony/DeviceState.java"
        "src/com/android/services/telephony/DisconnectCauseUtil.java"
        "src/com/android/services/telephony/EmergencyTonePlayer.java"
        "src/com/android/services/telephony/GsmConnection.java"
        "src/com/android/services/telephony/HoldTracker.java"
        "src/com/android/services/telephony/Holdable.java"
        "src/com/android/services/telephony/ImsConference.java"
        "src/com/android/services/telephony/ImsConferenceController.java"
        "src/com/android/services/telephony/Log.java"
        "src/com/android/services/telephony/PstnIncomingCallNotifier.java"
        "src/com/android/services/telephony/PstnPhoneCapabilitiesNotifier.java"
        "src/com/android/services/telephony/RadioOnHelper.java"
        "src/com/android/services/telephony/RadioOnStateListener.java"
        "src/com/android/services/telephony/TelecomAccountRegistry.java"
        "src/com/android/services/telephony/TelephonyConference.java"
        "src/com/android/services/telephony/TelephonyConferenceBase.java"
        "src/com/android/services/telephony/TelephonyConferenceController.java"
        "src/com/android/services/telephony/TelephonyConnection.java"
        "src/com/android/services/telephony/TelephonyConnectionService.java"
        "src/com/android/services/telephony/TelephonyConnectionServiceProxy.java"
        "src/com/android/services/telephony/rcs/RcsFeatureController.java"
        "src/com/android/services/telephony/rcs/TelephonyRcsService.java"
        "src/com/android/services/telephony/rcs/UserCapabilityExchangeImpl.java"
        "sip/src/com/android/services/telephony/sip/SipAccountRegistry.java"
        "sip/src/com/android/services/telephony/sip/SipConnection.java"
        "sip/src/com/android/services/telephony/sip/SipConnectionService.java"
        "sip/src/com/android/services/telephony/sip/SipEditor.java"
        "sip/src/com/android/services/telephony/sip/SipIncomingCallReceiver.java"
        "sip/src/com/android/services/telephony/sip/SipPhoneAccountSettingsActivity.java"
        "sip/src/com/android/services/telephony/sip/SipPreferences.java"
        "sip/src/com/android/services/telephony/sip/SipProfileDb.java"
        "sip/src/com/android/services/telephony/sip/SipSettings.java"
        "sip/src/com/android/services/telephony/sip/SipUtil.java"
        "sip/src/com/android/services/telephony/sip/components/TelephonySipService.java"
        "ecc/proto/protobuf_ecc_data.proto"
        "src/com/android/phone/EventLogTags.logtags"
    ];

    jarjar_rules = ":jarjar-rules-shared";

    resource_dirs = [
        "res"
        "sip/res"
    ];

    asset_dirs = [
        "assets"
        "ecc/output"
    ];

    aaptflags = [
        "--extra-packages com.android.services.telephony.sip"
    ];

    platform_apis = true;

    certificate = "platform";
    privileged = true;

    optimize = {
        proguard_flags_files = [
            "proguard.flags"
            "sip/proguard.flags"
        ];
    };

    proto = {
        type = "lite";
    };
};

in { inherit TeleService; }

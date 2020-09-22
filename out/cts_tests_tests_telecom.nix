{ android_test, filegroup, java_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

car-mode-app-srcs = filegroup {
    name = "car-mode-app-srcs";
    srcs = [
        "src/android/telecom/cts/carmodetestapp/CtsCarModeInCallService.java"
        "src/android/telecom/cts/carmodetestapp/CtsCarModeInCallServiceControl.java"
    ];
    path = "src/";
};

car-mode-app-aidl = filegroup {
    name = "car-mode-app-aidl";
    srcs = [
        "aidl/android/telecom/cts/carmodetestapp/ICtsCarModeInCallServiceControl.aidl"
    ];
    path = "aidl/";
};

CtsTelecomTestCases = android_test {
    name = "CtsTelecomTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "androidx.test.core"
        "androidx.test.rules"
        "CtsTelecomUtilLib"
    ];
    libs = [
        "android.test.base.stubs"
        "android.test.runner.stubs"
    ];
    srcs = [
        "src/android/telecom/cts/BackgroundCallAudioTest.java"
        "src/android/telecom/cts/BaseRemoteTelecomTest.java"
        "src/android/telecom/cts/BaseTelecomTestWithMockServices.java"
        "src/android/telecom/cts/BasicInCallServiceTest.java"
        "src/android/telecom/cts/CallDetailsTest.java"
        "src/android/telecom/cts/CallRedirectionServiceTest.java"
        "src/android/telecom/cts/CallScreeningServiceTest.java"
        "src/android/telecom/cts/CallTest.java"
        "src/android/telecom/cts/CarModeInCallServiceTest.java"
        "src/android/telecom/cts/ConferenceTest.java"
        "src/android/telecom/cts/ConnectionServiceTest.java"
        "src/android/telecom/cts/ConnectionTest.java"
        "src/android/telecom/cts/CtsConnectionService.java"
        "src/android/telecom/cts/CtsPhoneAccountSuggestionService.java"
        "src/android/telecom/cts/CtsRemoteConnectionService.java"
        "src/android/telecom/cts/CtsRoleManagerAdapter.java"
        "src/android/telecom/cts/CtsSelfManagedConnectionService.java"
        "src/android/telecom/cts/DataObjectUnitTests.java"
        "src/android/telecom/cts/DefaultDialerOperationsTest.java"
        "src/android/telecom/cts/DefaultPhoneAccountTest.java"
        "src/android/telecom/cts/EmergencyCallTests.java"
        "src/android/telecom/cts/ExtendedInCallServiceTest.java"
        "src/android/telecom/cts/ExternalCallTest.java"
        "src/android/telecom/cts/HandoverTest.java"
        "src/android/telecom/cts/IncomingCallTest.java"
        "src/android/telecom/cts/MissedCallTest.java"
        "src/android/telecom/cts/MockCallScreeningService.java"
        "src/android/telecom/cts/MockConference.java"
        "src/android/telecom/cts/MockConnection.java"
        "src/android/telecom/cts/MockConnectionService.java"
        "src/android/telecom/cts/MockInCallService.java"
        "src/android/telecom/cts/MockMissedCallNotificationReceiver.java"
        "src/android/telecom/cts/MockPhoneAccountChangedReceiver.java"
        "src/android/telecom/cts/MockVideoCallCallback.java"
        "src/android/telecom/cts/MockVideoProvider.java"
        "src/android/telecom/cts/NewOutgoingCallBroadcastReceiver.java"
        "src/android/telecom/cts/NumberDialingTest.java"
        "src/android/telecom/cts/OutgoingCallTest.java"
        "src/android/telecom/cts/PhoneAccountOperationsTest.java"
        "src/android/telecom/cts/PhoneAccountSuggestionServiceTest.java"
        "src/android/telecom/cts/PhoneAccountSuggestionTest.java"
        "src/android/telecom/cts/RemoteConferenceTest.java"
        "src/android/telecom/cts/RemoteConnectionTest.java"
        "src/android/telecom/cts/RttOperationsTest.java"
        "src/android/telecom/cts/SelfManagedConnection.java"
        "src/android/telecom/cts/SelfManagedConnectionServiceTest.java"
        "src/android/telecom/cts/SimCallManagerTest.java"
        "src/android/telecom/cts/TelecomAvailabilityTest.java"
        "src/android/telecom/cts/TelecomManagerTest.java"
        "src/android/telecom/cts/TestUtils.java"
        "src/android/telecom/cts/ThirdPartyCallScreeningServiceTest.java"
        "src/android/telecom/cts/ThirdPartyInCallServiceTest.java"
        "src/android/telecom/cts/VideoCallTest.java"
        "src/android/telecom/cts/VideoProfileTest.java"
        "src/android/telecom/cts/WiredHeadsetTest.java"
        "src/android/telecom/cts/carmodetestapp/CtsCarModeInCallService.java"
        "src/android/telecom/cts/carmodetestapp/CtsCarModeInCallServiceControl.java"
        "aidl/android/telecom/cts/carmodetestapp/ICtsCarModeInCallServiceControl.aidl"
        "CallScreeningServiceTestApp/src/android/telecom/cts/screeningtestapp/CallScreeningServiceControl.java"
        "CallScreeningServiceTestApp/src/android/telecom/cts/screeningtestapp/CtsCallScreeningService.java"
        "CallScreeningServiceTestApp/src/android/telecom/cts/screeningtestapp/CtsPostCallActivity.java"
        "CallScreeningServiceTestApp/aidl/android/telecom/cts/screeningtestapp/ICallScreeningControl.aidl"
        "ThirdPtyInCallServiceTestApp/src/android/telecom/cts/thirdptyincallservice/CtsThirdPartyInCallService.java"
        "ThirdPtyInCallServiceTestApp/src/android/telecom/cts/thirdptyincallservice/CtsThirdPartyInCallServiceControl.java"
        "ThirdPtyInCallServiceTestApp/aidl/android/telecom/cts/thirdptyincallservice/ICtsThirdPartyInCallServiceControl.aidl"
        "CallRedirectionServiceTestApp/src/android/telecom/cts/redirectiontestapp/CtsCallRedirectionService.java"
        "CallRedirectionServiceTestApp/src/android/telecom/cts/redirectiontestapp/CtsCallRedirectionServiceController.java"
        "CallRedirectionServiceTestApp/aidl/android/telecom/cts/redirectiontestapp/ICtsCallRedirectionServiceController.aidl"
        "Api29InCallServiceTestApp/src/android/telecom/cts/api29incallservice/CtsApi29InCallService.java"
        "Api29InCallServiceTestApp/src/android/telecom/cts/api29incallservice/CtsApi29InCallServiceControl.java"
        "Api29InCallServiceTestApp/aidl/android/telecom/cts/api29incallservice/ICtsApi29InCallServiceControl.aidl"
    ];
    exclude_srcs = [
        "src/android/telecom/cts/SelfManagedConnection.java"
        "src/android/telecom/cts/CtsSelfManagedConnectionService.java"
        "src/android/telecom/cts/TestUtils.java"
    ];
    aidl = {
        local_include_dirs = [
            "ThirdPtyInCallServiceTestApp/aidl/"
            "CallRedirectionServiceTestApp/aidl/"
            "CallScreeningServiceTestApp/aidl/"
            "aidl/"
        ];
    };
    sdk_version = "test_current";
    min_sdk_version = "21";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsTelecomMockLib = java_library {
    name = "CtsTelecomMockLib";
    srcs = [
        "src/android/telecom/cts/MockInCallService.java"
        "src/android/telecom/cts/MockVideoCallCallback.java"
        "src/android/telecom/cts/MockVideoProvider.java"
        "src/android/telecom/cts/MockConnection.java"
    ];
    static_libs = ["CtsTelecomUtilLib"];
    libs = [
        "androidx.test.core"
        "androidx.test.rules"
    ];
};

CtsTelecomUtilLib = java_library {
    name = "CtsTelecomUtilLib";
    srcs = [
        "src/android/telecom/cts/SelfManagedConnection.java"
        "src/android/telecom/cts/CtsSelfManagedConnectionService.java"
        "src/android/telecom/cts/TestUtils.java"
    ];
    libs = [
        "androidx.test.core"
        "androidx.test.rules"
    ];
};

in { inherit CtsTelecomMockLib CtsTelecomTestCases CtsTelecomUtilLib car-mode-app-aidl car-mode-app-srcs; }

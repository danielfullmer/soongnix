{ android_test }:
let

#
#  Copyright (C) 2009 The Android Open Source Project
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

TeleServiceTests = android_test {
    name = "TeleServiceTests";

    srcs = [
        "src/com/android/TelephonyTestBase.java"
        "src/com/android/TestContext.java"
        "src/com/android/phone/CallFeaturesSettingTest.java"
        "src/com/android/phone/CarrierXmlParserTest.java"
        "src/com/android/phone/LocationAccessPolicyTest.java"
        "src/com/android/phone/NumberVerificationManagerTest.java"
        "src/com/android/phone/PhoneGlobalsTest.java"
        "src/com/android/phone/ServiceStateProviderTest.java"
        "src/com/android/phone/ecc/EccDataTest.java"
        "src/com/android/phone/euicc/EuiccUiDispatcherActivityTest.java"
        "src/com/android/phone/tests/CallDialTest.java"
        "src/com/android/phone/tests/CallForwardInfoTest.java"
        "src/com/android/phone/tests/SendInstantTextTestService.java"
        "src/com/android/services/telephony/ConferenceParticipantConnectionTest.java"
        "src/com/android/services/telephony/DisconnectCauseUtilTest.java"
        "src/com/android/services/telephony/HoldTrackerTest.java"
        "src/com/android/services/telephony/ImsConferenceControllerTest.java"
        "src/com/android/services/telephony/ImsConferenceTest.java"
        "src/com/android/services/telephony/RadioOnStateListenerTest.java"
        "src/com/android/services/telephony/TelephonyConferenceControllerTest.java"
        "src/com/android/services/telephony/TelephonyConnectionServiceTest.java"
        "src/com/android/services/telephony/TelephonyConnectionTest.java"
        "src/com/android/services/telephony/TestTelephonyConnection.java"
        "src/com/android/services/telephony/rcs/RcsFeatureControllerTest.java"
        "src/com/android/services/telephony/rcs/TelephonyRcsServiceTest.java"
    ];

    libs = [
        "android.test.mock"
        "android.test.runner"
        "telephony-common"
        "android.test.base"
        "ims-common"
        "android.test.mock"
    ];
    platform_apis = true;
    certificate = "platform";

    instrumentation_for = "TeleService";

    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "androidx.test.espresso.core"
        "truth-prebuilt"
    ];

    test_suites = [
        "device-tests"
        "mts"
    ];

};

in { inherit TeleServiceTests; }
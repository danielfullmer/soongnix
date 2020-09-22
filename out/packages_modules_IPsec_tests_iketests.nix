{ android_test, filegroup }:
let

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

FrameworksIkeTests = android_test {
    name = "FrameworksIkeTests";

    srcs = [
        "src/java/android/net/eap/EapSessionConfigTest.java"
        "src/java/android/net/ipsec/ike/ChildSessionConfigurationTest.java"
        "src/java/android/net/ipsec/ike/ChildSessionParamsTest.java"
        "src/java/android/net/ipsec/ike/IkeSessionConfigurationTest.java"
        "src/java/android/net/ipsec/ike/IkeSessionConnectionInfoTest.java"
        "src/java/android/net/ipsec/ike/IkeSessionParamsTest.java"
        "src/java/android/net/ipsec/ike/IkeSessionTest.java"
        "src/java/android/net/ipsec/ike/IkeTrafficSelectorTest.java"
        "src/java/android/net/ipsec/ike/SaProposalTest.java"
        "src/java/android/net/ipsec/ike/TunnelModeChildSessionParamsTest.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeProtocolExceptionTest.java"
        "src/java/com/android/internal/net/TestUtils.java"
        "src/java/com/android/internal/net/eap/EapAkaPrimeTest.java"
        "src/java/com/android/internal/net/eap/EapAkaTest.java"
        "src/java/com/android/internal/net/eap/EapAuthenticatorTest.java"
        "src/java/com/android/internal/net/eap/EapErrorTest.java"
        "src/java/com/android/internal/net/eap/EapMethodEndToEndTest.java"
        "src/java/com/android/internal/net/eap/EapMsChapV2Test.java"
        "src/java/com/android/internal/net/eap/EapResponseTest.java"
        "src/java/com/android/internal/net/eap/EapSimTest.java"
        "src/java/com/android/internal/net/eap/EapSuccessTest.java"
        "src/java/com/android/internal/net/eap/EapTestUtils.java"
        "src/java/com/android/internal/net/eap/crypto/Fips186_2PrfTest.java"
        "src/java/com/android/internal/net/eap/crypto/HmacSha256ByteSignerTest.java"
        "src/java/com/android/internal/net/eap/crypto/ParityBitUtilTest.java"
        "src/java/com/android/internal/net/eap/message/EapDataTest.java"
        "src/java/com/android/internal/net/eap/message/EapMessageTest.java"
        "src/java/com/android/internal/net/eap/message/EapTestMessageDefinitions.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2ChallengeRequestTest.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2ChallengeResponseTest.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2FailureRequestTest.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2FailureResponseTest.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2PacketDefinitions.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2SuccessRequestTest.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2SuccessResponseTest.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2TypeDataTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapAkaPrimeTypeDataTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapAkaTypeDataTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimAkaAttributeFactoryTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimTypeDataTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtAutnTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtAutsTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtBiddingTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtClientErrorCodeTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtCounterTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtIdReqTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtIdentityTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtKdfInputTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtKdfTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtMacTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtNonceMtTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtNonceSTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtNotificationTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtPaddingTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtRandAkaTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtRandSimTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtResTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtSelectedVersionTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/AtVersionListTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/EapSimAkaAttributeTest.java"
        "src/java/com/android/internal/net/eap/message/simaka/attributes/EapTestAttributeDefinitions.java"
        "src/java/com/android/internal/net/eap/statemachine/CreatedStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaChallengeStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaCreatedStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaIdentityStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaMethodStateMachineTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeChallengeStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeCreatedStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeIdentityStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeMethodStateMachineTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2AwaitingEapFailureStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2AwaitingEapSuccessStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2ChallengeStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2CreatedStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2MethodStateMachineTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2StateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2ValidateAuthenticatorStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimAkaMethodStateMachineTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimChallengeStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimCreatedStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimMethodStateMachineTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimStartStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapStateMachineTest.java"
        "src/java/com/android/internal/net/eap/statemachine/EapStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/IdentityStateTest.java"
        "src/java/com/android/internal/net/eap/statemachine/MethodStateTest.java"
        "src/java/com/android/internal/net/ipsec/ike/ChildSessionStateMachineTest.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeLocalRequestSchedulerTest.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeSessionStateMachineTest.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeSessionTestBase.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeSocketTestBase.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdp4SocketTest.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdp6SocketTest.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdpEncapSocketTest.java"
        "src/java/com/android/internal/net/ipsec/ike/SaRecordTest.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeCombinedModeCipherTest.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeMacIntegrityTest.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeMacPrfTest.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeNormalModeCipherTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeAuthDigitalSignPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeAuthPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeAuthPskPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeCertPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeCertReqPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeCertX509CertPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeConfigPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeDeletePayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeEapPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeEncryptedPayloadBodyTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeHeaderTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeIdPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeKePayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeMessageTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeNoncePayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeNotifyPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeSaPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeSkPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeSkfPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeTestUtils.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeTsPayloadTest.java"
        "src/java/com/android/internal/net/ipsec/ike/testmode/DeterministicSecureRandomTest.java"
        "src/java/com/android/internal/net/ipsec/ike/testutils/CertUtils.java"
        "src/java/com/android/internal/net/ipsec/ike/testutils/MockIpSecTestUtils.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/RetransmitterTest.java"
        "src/java/com/android/internal/net/utils/BigIntegerUtilsTest.java"
        "src/java/com/android/internal/net/utils/LogTest.java"
        "src/java/com/android/internal/net/utils/SimpleStateMachineTest.java"
    ];

    platform_apis = true;
    certificate = "platform";
    test_suites = [
        "device-tests"
        "mts"
    ];

    compile_multilib = "both";

    libs = ["android.test.runner"];

    test_config = "FrameworksIkeTests.xml";

    static_libs = [
        #  TODO (b/149494912): Do not statically link ike and test against <uses-library>
        "ike_test" #  Runs against a test version of the IKE library, not on the system's copy.
        "androidx.test.rules"
        "frameworks-base-testutils"
        "mockito-target-inline-minus-junit4"
        "services.core"
    ];

    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
        "libmultiplejvmtiagentsinterferenceagent"
    ];
};

ike-test-utils = filegroup {
    name = "ike-test-utils";
    srcs = ["src/java/com/android/internal/net/ipsec/ike/testutils/CertUtils.java"];
};

in { inherit FrameworksIkeTests ike-test-utils; }

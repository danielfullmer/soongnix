{ filegroup, java_library, java_sdk_library }:
let

#  Copyright 2018 The Android Open Source Project
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

"android.net.ipsec.ike" = java_sdk_library {
    name = "android.net.ipsec.ike";
    installable = true;
    defaults = ["framework-module-defaults"];
    sdk_version = "module_current";

    #  ike is used as a shared library.
    shared_library = true;

    aidl = {
        local_include_dirs = ["src/java"];
    };
    srcs = [":ike-srcs"];

    static_libs = [
        "ike-internals"
    ];

    libs = [
        "unsupportedappusage"
        "framework-annotations-lib"
    ];

    api_packages = [
        "android.net.eap"
        "android.net.ipsec.ike"
        "android.net.ipsec.ike.exceptions"
    ];

    #  Shared filegroups of BouncyCastle and frameworks are jar-jar'ed to avoid
    #  being overwritten by the frameworks class copies.
    jarjar_rules = "jarjar-rules-shared.txt";

    hostdex = true; #  for hiddenapi check
    apex_available = [
        "com.android.ipsec"
        "test_com.android.ipsec"
    ];

    stubs_library_visibility = ["//visibility:public"];
};

ike-srcs = filegroup {
    name = "ike-srcs";
    srcs = [
        "src/java/android/net/eap/EapSessionConfig.java"
        "src/java/android/net/ipsec/ike/ChildSaProposal.java"
        "src/java/android/net/ipsec/ike/ChildSessionCallback.java"
        "src/java/android/net/ipsec/ike/ChildSessionConfiguration.java"
        "src/java/android/net/ipsec/ike/ChildSessionParams.java"
        "src/java/android/net/ipsec/ike/IkeDerAsn1DnIdentification.java"
        "src/java/android/net/ipsec/ike/IkeFqdnIdentification.java"
        "src/java/android/net/ipsec/ike/IkeIdentification.java"
        "src/java/android/net/ipsec/ike/IkeIpv4AddrIdentification.java"
        "src/java/android/net/ipsec/ike/IkeIpv6AddrIdentification.java"
        "src/java/android/net/ipsec/ike/IkeKeyIdIdentification.java"
        "src/java/android/net/ipsec/ike/IkeManager.java"
        "src/java/android/net/ipsec/ike/IkeRfc822AddrIdentification.java"
        "src/java/android/net/ipsec/ike/IkeSaProposal.java"
        "src/java/android/net/ipsec/ike/IkeSession.java"
        "src/java/android/net/ipsec/ike/IkeSessionCallback.java"
        "src/java/android/net/ipsec/ike/IkeSessionConfiguration.java"
        "src/java/android/net/ipsec/ike/IkeSessionConnectionInfo.java"
        "src/java/android/net/ipsec/ike/IkeSessionParams.java"
        "src/java/android/net/ipsec/ike/IkeTrafficSelector.java"
        "src/java/android/net/ipsec/ike/SaProposal.java"
        "src/java/android/net/ipsec/ike/TransportModeChildSessionParams.java"
        "src/java/android/net/ipsec/ike/TunnelModeChildSessionParams.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeException.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeInternalException.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeProtocolException.java"
        "src/java/com/android/internal/net/crypto/KeyGenerationUtils.java"
        "src/java/com/android/internal/net/eap/EapAuthenticator.java"
        "src/java/com/android/internal/net/eap/EapResult.java"
        "src/java/com/android/internal/net/eap/IEapCallback.java"
        "src/java/com/android/internal/net/eap/crypto/Fips186_2Prf.java"
        "src/java/com/android/internal/net/eap/crypto/HmacSha256ByteSigner.java"
        "src/java/com/android/internal/net/eap/crypto/ParityBitUtil.java"
        "src/java/com/android/internal/net/eap/exceptions/EapInvalidPacketLengthException.java"
        "src/java/com/android/internal/net/eap/exceptions/EapInvalidRequestException.java"
        "src/java/com/android/internal/net/eap/exceptions/EapSilentException.java"
        "src/java/com/android/internal/net/eap/exceptions/InvalidEapCodeException.java"
        "src/java/com/android/internal/net/eap/exceptions/InvalidEapResponseException.java"
        "src/java/com/android/internal/net/eap/exceptions/UnsupportedEapTypeException.java"
        "src/java/com/android/internal/net/eap/exceptions/mschapv2/EapMsChapV2ParsingException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapAkaInvalidAuthenticationResponse.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimAkaAuthenticationFailureException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimAkaIdentityUnavailableException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimAkaInvalidAtPaddingException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimAkaInvalidAttributeException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimAkaInvalidLengthException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimAkaUnsupportedAttributeException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimInvalidAtRandException.java"
        "src/java/com/android/internal/net/eap/exceptions/simaka/EapSimInvalidTypeDataException.java"
        "src/java/com/android/internal/net/eap/message/EapData.java"
        "src/java/com/android/internal/net/eap/message/EapMessage.java"
        "src/java/com/android/internal/net/eap/message/mschapv2/EapMsChapV2TypeData.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapAkaAttributeFactory.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapAkaPrimeAttributeFactory.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapAkaPrimeTypeData.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapAkaTypeData.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimAkaAttribute.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimAkaAttributeFactory.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimAkaTypeData.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimAttributeFactory.java"
        "src/java/com/android/internal/net/eap/message/simaka/EapSimTypeData.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaMethodStateMachine.java"
        "src/java/com/android/internal/net/eap/statemachine/EapAkaPrimeMethodStateMachine.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMethodStateMachine.java"
        "src/java/com/android/internal/net/eap/statemachine/EapMsChapV2MethodStateMachine.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimAkaMethodStateMachine.java"
        "src/java/com/android/internal/net/eap/statemachine/EapSimMethodStateMachine.java"
        "src/java/com/android/internal/net/eap/statemachine/EapStateMachine.java"
        "src/java/com/android/internal/net/ipsec/ike/AbstractSessionStateMachine.java"
        "src/java/com/android/internal/net/ipsec/ike/ChildSessionStateMachine.java"
        "src/java/com/android/internal/net/ipsec/ike/ChildSessionStateMachineFactory.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeDhParams.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeEapAuthenticatorFactory.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeLocalRequestScheduler.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeSessionStateMachine.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeSocket.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdp4Socket.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdp6Socket.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdpEncapSocket.java"
        "src/java/com/android/internal/net/ipsec/ike/IkeUdpSocket.java"
        "src/java/com/android/internal/net/ipsec/ike/SaRecord.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/AesXCbcImpl.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeCipher.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeCombinedModeCipher.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeCrypto.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeMac.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeMacIntegrity.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeMacPrf.java"
        "src/java/com/android/internal/net/ipsec/ike/crypto/IkeNormalModeCipher.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/AuthenticationFailedException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/InvalidKeException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/InvalidMajorVersionException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/InvalidMessageIdException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/InvalidSyntaxException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/NoValidProposalChosenException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/TemporaryFailureException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/TsUnacceptableException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/UnrecognizedIkeProtocolException.java"
        "src/java/com/android/internal/net/ipsec/ike/exceptions/UnsupportedCriticalPayloadException.java"
        "src/java/com/android/internal/net/ipsec/ike/keepalive/HardwareKeepaliveImpl.java"
        "src/java/com/android/internal/net/ipsec/ike/keepalive/IkeNattKeepalive.java"
        "src/java/com/android/internal/net/ipsec/ike/keepalive/SoftwareKeepaliveImpl.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeAuthDigitalSignPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeAuthPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeAuthPskPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeCertPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeCertReqPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeCertX509CertPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeConfigPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeDeletePayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeEapPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeEncryptedPayloadBody.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeHeader.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeIdPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeInformationalPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeKePayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeMessage.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeNoncePayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeNotifyPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkePayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkePayloadFactory.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeSaPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeSkPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeSkfPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeTsPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeUnsupportedPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/message/IkeVendorPayload.java"
        "src/java/com/android/internal/net/ipsec/ike/testmode/DeterministicSecureRandom.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/FdEventsReader.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/IkeAlarmReceiver.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/IkeSecurityParameterIndex.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/IkeSpiGenerator.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/IpSecSpiGenerator.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/PacketReader.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/RandomnessFactory.java"
        "src/java/com/android/internal/net/ipsec/ike/utils/Retransmitter.java"
        "src/java/com/android/internal/net/utils/BigIntegerUtils.java"
        "src/java/com/android/internal/net/utils/Log.java"
        "src/java/com/android/internal/net/utils/SimpleStateMachine.java"
        ":framework-ike-shared-srcs"
    ];
};

ike-api-srcs = filegroup {
    name = "ike-api-srcs";
    srcs = [
        "src/java/android/net/eap/EapSessionConfig.java"
        "src/java/android/net/ipsec/ike/ChildSaProposal.java"
        "src/java/android/net/ipsec/ike/ChildSessionCallback.java"
        "src/java/android/net/ipsec/ike/ChildSessionConfiguration.java"
        "src/java/android/net/ipsec/ike/ChildSessionParams.java"
        "src/java/android/net/ipsec/ike/IkeDerAsn1DnIdentification.java"
        "src/java/android/net/ipsec/ike/IkeFqdnIdentification.java"
        "src/java/android/net/ipsec/ike/IkeIdentification.java"
        "src/java/android/net/ipsec/ike/IkeIpv4AddrIdentification.java"
        "src/java/android/net/ipsec/ike/IkeIpv6AddrIdentification.java"
        "src/java/android/net/ipsec/ike/IkeKeyIdIdentification.java"
        "src/java/android/net/ipsec/ike/IkeManager.java"
        "src/java/android/net/ipsec/ike/IkeRfc822AddrIdentification.java"
        "src/java/android/net/ipsec/ike/IkeSaProposal.java"
        "src/java/android/net/ipsec/ike/IkeSession.java"
        "src/java/android/net/ipsec/ike/IkeSessionCallback.java"
        "src/java/android/net/ipsec/ike/IkeSessionConfiguration.java"
        "src/java/android/net/ipsec/ike/IkeSessionConnectionInfo.java"
        "src/java/android/net/ipsec/ike/IkeSessionParams.java"
        "src/java/android/net/ipsec/ike/IkeTrafficSelector.java"
        "src/java/android/net/ipsec/ike/SaProposal.java"
        "src/java/android/net/ipsec/ike/TransportModeChildSessionParams.java"
        "src/java/android/net/ipsec/ike/TunnelModeChildSessionParams.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeException.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeInternalException.java"
        "src/java/android/net/ipsec/ike/exceptions/IkeProtocolException.java"
    ];
    path = "src/java/";
};

#  Provides internal classes needed to build the ike sources.
ike-internals = java_library {
    name = "ike-internals";
    apex_available = [
        "com.android.ipsec"
        "test_com.android.ipsec"
    ];
    static_libs = ["bouncycastle_ike_digests"];
    sdk_version = "core_current";
};

ike_test = java_library {
    name = "ike_test";
    installable = false; #  Used only for testing; never installed alone.
    srcs = [":ike-srcs"];
    libs = ["unsupportedappusage"];
    static_libs = ["ike-internals"];

    #  Shared filegroups of BouncyCastle and frameworks are jar-jar'ed to avoid
    #  being overwritten by the frameworks class copies.
    jarjar_rules = "jarjar-rules-shared.txt";
};

in { inherit "android.net.ipsec.ike" ike-api-srcs ike-internals ike-srcs ike_test; }

{ java_library }:
let

#  Copyright 2019 Google LLC
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Android build file for building the library in AOSP
#  https://android.googlesource.com/platform/external/ukey2

ukey2 = java_library {
    name = "ukey2";
    proto = {
        type = "lite";
        include_dirs = ["external/ukey2/src/main/proto"];
    };
    srcs = [
        "src/main/proto/device_to_device_messages.proto"
        "src/main/proto/passwordless_auth_payloads.proto"
        "src/main/proto/proximity_payloads.proto"
        "src/main/proto/securegcm.proto"
        "src/main/proto/securemessage.proto"
        "src/main/proto/ukey.proto"
        "src/main/java/com/google/security/annotations/CryptoAnnotation.java"
        "src/main/java/com/google/security/annotations/SuppressInsecureCipherModeCheckerNoReview.java"
        "src/main/java/com/google/security/annotations/SuppressInsecureCipherModeCheckerPendingReview.java"
        "src/main/java/com/google/security/annotations/SuppressInsecureCipherModeCheckerReviewed.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DConnectionContext.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DConnectionContextV0.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DConnectionContextV1.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DCryptoOps.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DDiffieHellmanKeyExchangeHandshake.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DHandshakeContext.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/D2DSpakeEd25519Handshake.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/Ed25519.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/EnrollmentCryptoOps.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/HandshakeException.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/KeyEncoding.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/SecureGcmConstants.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/TransportCryptoOps.java"
        "src/main/java/com/google/security/cryptauth/lib/securegcm/Ukey2Handshake.java"
        "src/main/java/com/google/security/cryptauth/lib/securemessage/CryptoOps.java"
        "src/main/java/com/google/security/cryptauth/lib/securemessage/PublicKeyProtoUtil.java"
        "src/main/java/com/google/security/cryptauth/lib/securemessage/SecureMessageBuilder.java"
        "src/main/java/com/google/security/cryptauth/lib/securemessage/SecureMessageParser.java"
    ];
    libs = [
        "guava"
    ];
};

in { inherit ukey2; }

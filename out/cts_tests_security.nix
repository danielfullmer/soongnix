{ java_library }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

cts-security-test-support-library = java_library {
    name = "cts-security-test-support-library";
    static_libs = [
        "bouncycastle-unbundled"
        "bouncycastle-bcpkix-unbundled"
        "guava"
        "truth-prebuilt"
        "testng"
    ];
    srcs = [
        "src/android/keystore/cts/Asn1Utils.java"
        "src/android/keystore/cts/Attestation.java"
        "src/android/keystore/cts/AttestationApplicationId.java"
        "src/android/keystore/cts/AttestationPackageInfo.java"
        "src/android/keystore/cts/AuthorizationList.java"
        "src/android/keystore/cts/CertificateUtils.java"
        "src/android/keystore/cts/KeyGenerationUtils.java"
        "src/android/keystore/cts/RootOfTrust.java"
    ];
};

in { inherit cts-security-test-support-library; }

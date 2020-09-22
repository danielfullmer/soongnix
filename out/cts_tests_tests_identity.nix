{ android_test }:
let

#  Copyright 2019 The Android Open Source Project
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

CtsIdentityTestCases = android_test {
    name = "CtsIdentityTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "junit"
        "cts-security-test-support-library"
        "cts-keystore-user-auth-helper-library"
        "platformprotosnano"
        "cbor-java"
        "cts-wm-util"
    ];
    srcs = [
        "src/android/security/identity/cts/AttestationTest.java"
        "src/android/security/identity/cts/CreateItemsRequestTest.java"
        "src/android/security/identity/cts/DynamicAuthTest.java"
        "src/android/security/identity/cts/EphemeralKeyTest.java"
        "src/android/security/identity/cts/HkdfTest.java"
        "src/android/security/identity/cts/IdentityApiTest.java"
        "src/android/security/identity/cts/ParsedAttestationRecord.java"
        "src/android/security/identity/cts/ProvisioningTest.java"
        "src/android/security/identity/cts/ReaderAuthTest.java"
        "src/android/security/identity/cts/UserAuthTest.java"
        "src/android/security/identity/cts/Util.java"
        "src/android/security/identity/cts/UtilUnitTests.java"
        "src/android/security/identity/cts/X509CertificateSigningTest.java"
    ];
    #  Can't use public/test API only because some tests use hidden API
    #  (e.g. device-provided Bouncy Castle).
    #
    #  The comment below is not particularly accurate, but it's copied from other
    #  tests that do the same thing, so anyone grepping for it will find it here.
    #
    #  Uncomment when b/13282254 is fixed.
    #  sdk_version: "current"
    platform_apis = true;
};

in { inherit CtsIdentityTestCases; }

{ android_test, java_library }:
let

#  Copyright 2013 The Android Open Source Project
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

cts-keystore-user-auth-helper-library = java_library {
    name = "cts-keystore-user-auth-helper-library";

    srcs = [];

    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "hamcrest-library"
        "junit"
        "platformprotosnano"
    ];

    platform_apis = true;
};

CtsKeystoreTestCases = android_test {
    name = "CtsKeystoreTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = [
        "bouncycastle-unbundled"
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.test.rules"
        "core-tests-support"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "hamcrest-library"
        "guava"
        "junit"
        "cts-security-test-support-library"
        "cts-keystore-user-auth-helper-library"
        "platformprotosnano"
        "cts-wm-util"
        "testng"
    ];
    srcs = [
        "src/android/keystore/cts/AES128CBCNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES128CBCPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/AES128CTRNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES128ECBNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES128ECBPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/AES128GCMNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES192CBCNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES192CBCPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/AES192CTRNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES192ECBNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES192ECBPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/AES192GCMNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES256CBCNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES256CBCPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/AES256CTRNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES256ECBNoPaddingCipherTest.java"
        "src/android/keystore/cts/AES256ECBPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/AES256GCMNoPaddingCipherTest.java"
        "src/android/keystore/cts/AESCBCCipherTestBase.java"
        "src/android/keystore/cts/AESCBCNoPaddingCipherTestBase.java"
        "src/android/keystore/cts/AESCBCPKS7PaddingCipherTestBase.java"
        "src/android/keystore/cts/AESCTRCipherTestBase.java"
        "src/android/keystore/cts/AESCTRNoPaddingCipherTestBase.java"
        "src/android/keystore/cts/AESCipherNistCavpKatTest.java"
        "src/android/keystore/cts/AESECBCipherTestBase.java"
        "src/android/keystore/cts/AESECBNoPaddingCipherTestBase.java"
        "src/android/keystore/cts/AESECBPKCS7PaddingCipherTestBase.java"
        "src/android/keystore/cts/AESGCMCipherTestBase.java"
        "src/android/keystore/cts/AESGCMNoPaddingCipherTestBase.java"
        "src/android/keystore/cts/AesCipherPerformanceTest.java"
        "src/android/keystore/cts/AesKeyGenPerformanceTest.java"
        "src/android/keystore/cts/AndroidKeyStoreTest.java"
        "src/android/keystore/cts/AttestationPerformanceTest.java"
        "src/android/keystore/cts/BlockCipherTestBase.java"
        "src/android/keystore/cts/CipherTest.java"
        "src/android/keystore/cts/CountingSecureRandom.java"
        "src/android/keystore/cts/DESedeCBCNoPaddingCipherTest.java"
        "src/android/keystore/cts/DESedeCBCPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/DESedeCipherTestBase.java"
        "src/android/keystore/cts/DESedeECBNoPaddingCipherTest.java"
        "src/android/keystore/cts/DESedeECBPKCS7PaddingCipherTest.java"
        "src/android/keystore/cts/DesCipherPerformanceTest.java"
        "src/android/keystore/cts/DesKeyGenPerformanceTest.java"
        "src/android/keystore/cts/ECCurves.java"
        "src/android/keystore/cts/ECDSASignatureTest.java"
        "src/android/keystore/cts/EcKeyGenPerformanceTest.java"
        "src/android/keystore/cts/EcdsaSignaturePerformanceTest.java"
        "src/android/keystore/cts/EmptyArray.java"
        "src/android/keystore/cts/HexEncoding.java"
        "src/android/keystore/cts/HmacKeyGenPerformanceTest.java"
        "src/android/keystore/cts/HmacMacPerformanceTest.java"
        "src/android/keystore/cts/ImportWrappedKeyTest.java"
        "src/android/keystore/cts/ImportedKey.java"
        "src/android/keystore/cts/KeyAttestationTest.java"
        "src/android/keystore/cts/KeyChainTest.java"
        "src/android/keystore/cts/KeyFactoryTest.java"
        "src/android/keystore/cts/KeyGenParameterSpecTest.java"
        "src/android/keystore/cts/KeyGeneratorTest.java"
        "src/android/keystore/cts/KeyInfoTest.java"
        "src/android/keystore/cts/KeyPairGeneratorSpecTest.java"
        "src/android/keystore/cts/KeyPairGeneratorTest.java"
        "src/android/keystore/cts/KeyProtectionTest.java"
        "src/android/keystore/cts/KeyStoreTest.java"
        "src/android/keystore/cts/MacTest.java"
        "src/android/keystore/cts/PerformanceTestBase.java"
        "src/android/keystore/cts/PerformanceTestResult.java"
        "src/android/keystore/cts/PutOverflowTest.java"
        "src/android/keystore/cts/RSACipherTest.java"
        "src/android/keystore/cts/RSASignatureTest.java"
        "src/android/keystore/cts/RsaCipherPerformanceTest.java"
        "src/android/keystore/cts/RsaKeyGenPerformanceTest.java"
        "src/android/keystore/cts/RsaSignaturePerformanceTest.java"
        "src/android/keystore/cts/SecretKeyFactoryTest.java"
        "src/android/keystore/cts/SignatureTest.java"
        "src/android/keystore/cts/TestUtils.java"
        "src/android/keystore/cts/TransparentSecretKey.java"
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

in { inherit CtsKeystoreTestCases cts-keystore-user-auth-helper-library; }

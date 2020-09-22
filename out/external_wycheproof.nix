{ java_library_static, package }:
let

#
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
#

_missingName = package {
    default_visibility = ["//visibility:private"];
};

wycheproof = java_library_static {
    name = "wycheproof";
    visibility = [
        "//cts/tests/libcore/wycheproof"
        "//cts/tests/libcore/wycheproof-bc"
    ];
    srcs = [
        "java/com/google/security/wycheproof/BouncyCastleAllTests.java"
        "java/com/google/security/wycheproof/BouncyCastleTest.java"
        "java/com/google/security/wycheproof/ConscryptTest.java"
        "java/com/google/security/wycheproof/EcUtil.java"
        "java/com/google/security/wycheproof/OpenJDKAllTests.java"
        "java/com/google/security/wycheproof/OpenJDKTest.java"
        "java/com/google/security/wycheproof/ProviderIndependentTest.java"
        "java/com/google/security/wycheproof/RandomUtil.java"
        "java/com/google/security/wycheproof/SpongyCastleAllTests.java"
        "java/com/google/security/wycheproof/SpongyCastleTest.java"
        "java/com/google/security/wycheproof/TestUtil.java"
        "java/com/google/security/wycheproof/WycheproofRunner.java"
        "java/com/google/security/wycheproof/testcases/AesEaxTest.java"
        "java/com/google/security/wycheproof/testcases/AesGcmTest.java"
        "java/com/google/security/wycheproof/testcases/BasicTest.java"
        "java/com/google/security/wycheproof/testcases/BigIntegerTest.java"
        "java/com/google/security/wycheproof/testcases/CipherInputStreamTest.java"
        "java/com/google/security/wycheproof/testcases/CipherOutputStreamTest.java"
        "java/com/google/security/wycheproof/testcases/DhTest.java"
        "java/com/google/security/wycheproof/testcases/DhiesTest.java"
        "java/com/google/security/wycheproof/testcases/DsaTest.java"
        "java/com/google/security/wycheproof/testcases/EcKeyTest.java"
        "java/com/google/security/wycheproof/testcases/EcdhTest.java"
        "java/com/google/security/wycheproof/testcases/EcdsaTest.java"
        "java/com/google/security/wycheproof/testcases/EciesTest.java"
        "java/com/google/security/wycheproof/testcases/RsaEncryptionTest.java"
        "java/com/google/security/wycheproof/testcases/RsaKeyTest.java"
        "java/com/google/security/wycheproof/testcases/RsaSignatureTest.java"
    ];
    exclude_srcs = [
        "java/com/google/security/wycheproof/SpongyCastleTest.java"
        "java/com/google/security/wycheproof/SpongyCastleAllTests.java"
    ];
    sdk_version = "none";
    system_modules = "art-module-platform-api-stubs-system-modules";
    libs = [
        "conscrypt.module.platform.api.stubs"
        "junit"
    ];
};

in { inherit _missingName wycheproof; }

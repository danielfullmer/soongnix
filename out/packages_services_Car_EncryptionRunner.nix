{ android_library, android_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

EncryptionRunner = android_library {
    name = "EncryptionRunner";
    min_sdk_version = "23";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    static_libs = [
        "ukey2"
    ];
    srcs = [
        "src/android/car/encryptionrunner/DummyEncryptionRunner.java"
        "src/android/car/encryptionrunner/EncryptionRunner.java"
        "src/android/car/encryptionrunner/EncryptionRunnerFactory.java"
        "src/android/car/encryptionrunner/HandshakeException.java"
        "src/android/car/encryptionrunner/HandshakeMessage.java"
        "src/android/car/encryptionrunner/Key.java"
        "src/android/car/encryptionrunner/Ukey2EncryptionRunner.java"
    ];
    installable = true;
};

EncryptionRunnerTest = android_test {
    name = "EncryptionRunnerTest";
    min_sdk_version = "23";
    srcs = [
        "test/android/car/encryptionrunner/EncryptionRunnerTest.java"
        "test/android/car/encryptionrunner/Ukey2EncryptionRunnerTest.java"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    libs = [
        "android.test.base"
        "android.test.runner"
    ];
    static_libs = [
        "androidx.test.rules"
        "EncryptionRunner"
        "junit"
        "truth-prebuilt"
    ];
};

in { inherit EncryptionRunner EncryptionRunnerTest; }

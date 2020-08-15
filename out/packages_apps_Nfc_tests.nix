{ android_test }:
let

#  Copyright 2011, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

NfcTests = android_test {
    name = "NfcTests";
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    #  Include all test java files.
    srcs = [
        "src/com/android/nfc/MockLlcpSocket.java"
        "src/com/android/nfc/snep/SnepBasicTests.java"
        "src/com/android/nfc/snep/SnepCustomClientTests.java"
        "src/com/android/nfc/snep/SnepDefaultClientTests.java"
        "src/com/android/nfc/snep/SnepValidationClientTests.java"
        "src/com/android/nfc/snep/SnepValidationServerTests.java"
    ];
    platform_apis = true;
    certificate = "platform";
    instrumentation_for = "NfcNci";
};

in { inherit NfcTests; }

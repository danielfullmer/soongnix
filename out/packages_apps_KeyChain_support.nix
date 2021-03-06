{ android_test, java_library }:
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

"com.android.keychain.tests.support" = java_library {
    name = "com.android.keychain.tests.support";
    srcs = ["src/com/android/keychain/tests/support/IKeyChainServiceTestSupport.aidl"];
};

KeyChainTestsSupport = android_test {
    name = "KeyChainTestsSupport";
    srcs = ["src/com/android/keychain/tests/support/KeyChainServiceTestSupport.java"];
    platform_apis = true;
    static_libs = [
        "com.android.keychain.tests.support"
        "junit"
    ];
    certificate = "platform";
};

in { inherit "com.android.keychain.tests.support" KeyChainTestsSupport; }

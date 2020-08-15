{ android_app }:
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

KeyChain = android_app {
    name = "KeyChain";
    srcs = [
        "src/com/android/keychain/KeyChainActivity.java"
        "src/com/android/keychain/KeyChainService.java"
        "src/com/android/keychain/internal/ExistingKeysProvider.java"
        "src/com/android/keychain/internal/GrantsDatabase.java"
        "src/com/android/keychain/internal/KeyInfoProvider.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit KeyChain; }

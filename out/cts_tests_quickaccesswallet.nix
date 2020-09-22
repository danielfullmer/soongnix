{ android_test }:
let

#  Copyright 2020 The Android Open Source Project
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

CtsQuickAccessWalletTestCases = android_test {
    name = "CtsQuickAccessWalletTestCases";
    defaults = ["cts_defaults"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    static_libs = [
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "androidx.test.uiautomator_uiautomator"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/quickaccesswallet/NoPermissionQuickAccessWalletService.java"
        "src/android/quickaccesswallet/QuickAccessWalletActivity.java"
        "src/android/quickaccesswallet/QuickAccessWalletSettingsActivity.java"
        "src/android/quickaccesswallet/TestHostApduService.java"
        "src/android/quickaccesswallet/TestQuickAccessWalletService.java"
        "src/android/quickaccesswallet/cts/GetWalletCardsErrorTest.java"
        "src/android/quickaccesswallet/cts/GetWalletCardsRequestTest.java"
        "src/android/quickaccesswallet/cts/GetWalletCardsResponseTest.java"
        "src/android/quickaccesswallet/cts/QuickAccessWalletClientTest.java"
        "src/android/quickaccesswallet/cts/SelectWalletCardRequestTest.java"
        "src/android/quickaccesswallet/cts/TestUtils.java"
        "src/android/quickaccesswallet/cts/WalletCardTest.java"
        "src/android/quickaccesswallet/cts/WalletServiceEventTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsQuickAccessWalletTestCases; }

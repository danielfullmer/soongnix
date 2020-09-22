{ android_test }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

CtsAccountManagerTestCases = android_test {
    name = "CtsAccountManagerTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "CtsAccountTestsCommon"
        "ctstestrunner-axt"
        "platform-test-annotations"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/accounts/cts/AbstractAuthenticatorTests.java"
        "src/android/accounts/cts/AccountAuthenticatorDummyActivity.java"
        "src/android/accounts/cts/AccountDummyActivity.java"
        "src/android/accounts/cts/AccountManagerTest.java"
        "src/android/accounts/cts/AccountManagerUnaffiliatedAuthenticatorTests.java"
        "src/android/accounts/cts/AccountRemovalDummyActivity.java"
        "src/android/accounts/cts/AccountTest.java"
        "src/android/accounts/cts/AuthenticatorDescriptionTest.java"
        "src/android/accounts/cts/ExceptionTest.java"
        "src/android/accounts/cts/MockAccountAuthenticator.java"
        "src/android/accounts/cts/MockAccountService.java"
        "src/android/accounts/cts/MockCustomTokenAccountService.java"
    ];
    certificate = ":cts-testkey1";
    min_sdk_version = "1";
    sdk_version = "current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsAccountManagerTestCases; }
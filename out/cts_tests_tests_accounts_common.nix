{ java_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsAccountTestsCommon = java_library {
    name = "CtsAccountTestsCommon";
    #  Includes all the java files, and explicitly declares any aidl files
    srcs = [
        "src/android/accounts/cts/common/AuthenticatorContentProvider.java"
        "src/android/accounts/cts/common/Fixtures.java"
        "src/android/accounts/cts/common/TestAccountAuthenticator.java"
        "src/android/accounts/cts/common/TestAuthenticatorActivity.java"
        "src/android/accounts/cts/common/TestDefaultAuthenticator.java"
        "src/android/accounts/cts/common/tx/AddAccountTx.java"
        "src/android/accounts/cts/common/tx/ConfirmCredentialsTx.java"
        "src/android/accounts/cts/common/tx/EditPropertiesTx.java"
        "src/android/accounts/cts/common/tx/GetAccountRemovalAllowedTx.java"
        "src/android/accounts/cts/common/tx/GetAuthTokenLabelTx.java"
        "src/android/accounts/cts/common/tx/GetAuthTokenTx.java"
        "src/android/accounts/cts/common/tx/HasFeaturesTx.java"
        "src/android/accounts/cts/common/tx/StartAddAccountSessionTx.java"
        "src/android/accounts/cts/common/tx/StartUpdateCredentialsSessionTx.java"
        "src/android/accounts/cts/common/tx/UpdateCredentialsTx.java"

    ];
    aidl = {
        local_include_dirs = ["src"];
    };
    min_sdk_version = "1";
    sdk_version = "current";
};

in { inherit CtsAccountTestsCommon; }

{ android_test }:
let

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

CtsIntentSignatureTestCases = android_test {
    name = "CtsIntentSignatureTestCases";
    defaults = ["cts_defaults"];

    srcs = ["src/android/signature/cts/intent/IntentTest.java"];
    java_resources = [
        ":cts-current-api-gz"
        ":cts-system-current-api-gz"
        ":cts-system-removed-api-gz"
    ];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    sdk_version = "test_current";

    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "cts-signature-common"
    ];

    host_required = ["cts-dynamic-config"];
};

in { inherit CtsIntentSignatureTestCases; }
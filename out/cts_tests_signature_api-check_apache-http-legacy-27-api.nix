{ android_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

CtsApacheHttpLegacy27ApiSignatureTestCases = android_test {
    name = "CtsApacheHttpLegacy27ApiSignatureTestCases";
    defaults = [
        "signature-api-check-defaults"
    ];
    java_resources = [
        ":cts-current-api-gz"
        ":cts-apache-http-legacy-current-api-gz"
    ];
    min_sdk_version = "27";

    use_embedded_native_libs = false;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsApacheHttpLegacy27ApiSignatureTestCases; }
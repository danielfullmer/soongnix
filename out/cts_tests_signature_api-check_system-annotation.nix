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

CtsSystemApiAnnotationTestCases = android_test {
    name = "CtsSystemApiAnnotationTestCases";
    defaults = [
        "signature-api-check-defaults"
    ];
    static_libs = [
        "compatibility-device-util-axt"
    ];
    java_resources = [
        ":cts-system-current-api-gz"
        ":cts-system-removed-api-gz"
        ":cts-car-system-current-api-gz"
        ":cts-car-system-removed-api-gz"
    ];
    min_sdk_version = "27";

    use_embedded_native_libs = false;
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsSystemApiAnnotationTestCases; }
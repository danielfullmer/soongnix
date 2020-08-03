{ android_test }:
let

#
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
#

CtsOverlayPolicyAll = android_test {
    name = "CtsOverlayPolicyAll";
    defaults = ["cts_support_defaults"];
    manifest = "AndroidManifest.xml";
    sdk_version = "current";
    certificate = ":cts-testkey1";
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

CtsOverlayPolicyAllPie = android_test {
    name = "CtsOverlayPolicyAllPie";
    defaults = ["cts_support_defaults"];
    manifest = "AndroidManifestNoName.xml";
    sdk_version = "28";
    certificate = ":cts-testkey1";
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

CtsOverlayPolicyAllNoName = android_test {
    name = "CtsOverlayPolicyAllNoName";
    defaults = ["cts_support_defaults"];
    manifest = "AndroidManifestNoName.xml";
    sdk_version = "current";
    certificate = ":cts-testkey1";
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

CtsOverlayPolicyAllNoNameDifferentCert = android_test {
    name = "CtsOverlayPolicyAllNoNameDifferentCert";
    defaults = ["cts_support_defaults"];
    manifest = "AndroidManifestNoName.xml";
    sdk_version = "current";
    certificate = ":cts-testkey2";
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsOverlayPolicyAll CtsOverlayPolicyAllNoName CtsOverlayPolicyAllNoNameDifferentCert CtsOverlayPolicyAllPie; }

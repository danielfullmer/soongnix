{ android_test_helper_app, java_defaults }:
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

CtsSignedConfigDefaults = java_defaults {
    name = "CtsSignedConfigDefaults";
    sdk_version = "current";
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    srcs = ["src/android/cts/signedconfig/app/Empty.java"];
};

CtsSignedConfigTestAppV1 = android_test_helper_app {
    name = "CtsSignedConfigTestAppV1";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_AndroidManifest.xml";
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV1_instant = android_test_helper_app {
    name = "CtsSignedConfigTestAppV1_instant";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_instant_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV2 = android_test_helper_app {
    name = "CtsSignedConfigTestAppV2";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version2_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV2_instant = android_test_helper_app {
    name = "CtsSignedConfigTestAppV2_instant";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version2_instant_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestApp2V1 = android_test_helper_app {
    name = "CtsSignedConfigTestApp2V1";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_package2_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestApp2V2 = android_test_helper_app {
    name = "CtsSignedConfigTestApp2V2";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version2_package2_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV1_badsignature = android_test_helper_app {
    name = "CtsSignedConfigTestAppV1_badsignature";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_badsignature_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV1_badb64_config = android_test_helper_app {
    name = "CtsSignedConfigTestAppV1_badb64_config";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_badb64_config_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV1_badb64_signature = android_test_helper_app {
    name = "CtsSignedConfigTestAppV1_badb64_signature";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_badb64_signature_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV3_configv1 = android_test_helper_app {
    name = "CtsSignedConfigTestAppV3_configv1";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version3_configv1_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSignedConfigTestAppV1_debug_key = android_test_helper_app {
    name = "CtsSignedConfigTestAppV1_debug_key";
    defaults = ["CtsSignedConfigDefaults"];
    manifest = "version1_debug_key_AndroidManifest.xml";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsSignedConfigDefaults CtsSignedConfigTestApp2V1 CtsSignedConfigTestApp2V2 CtsSignedConfigTestAppV1 CtsSignedConfigTestAppV1_badb64_config CtsSignedConfigTestAppV1_badb64_signature CtsSignedConfigTestAppV1_badsignature CtsSignedConfigTestAppV1_debug_key CtsSignedConfigTestAppV1_instant CtsSignedConfigTestAppV2 CtsSignedConfigTestAppV2_instant CtsSignedConfigTestAppV3_configv1; }

{ android_test_helper_app, java_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsRollbackManagerHostTestCases = java_test_host {
    name = "CtsRollbackManagerHostTestCases";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    libs = [
        "cts-tradefed"
        "tradefed"
        "truth-prebuilt"
    ];
    data = [":CtsRollbackManagerHostTestHelperApp"];
    test_suites = [
        "cts"
        "general-tests"
    ];
};

CtsRollbackManagerHostTestHelperApp = android_test_helper_app {
    name = "CtsRollbackManagerHostTestHelperApp";
    srcs = ["app/src/**/*.java"];
    static_libs = [
        "androidx.test.rules"
        "cts-rollback-lib"
    ];
    manifest = "app/AndroidManifest.xml";
    java_resources = [
        ":StagedInstallTestApexV2"
        ":StagedInstallTestApexV3"
    ];
    sdk_version = "test_current";
    test_suites = ["device-tests"];
};

in { inherit CtsRollbackManagerHostTestCases CtsRollbackManagerHostTestHelperApp; }

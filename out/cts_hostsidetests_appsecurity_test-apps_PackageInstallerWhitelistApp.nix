{ android_test_helper_app }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsPkgInstallerPermWhitelistApp = android_test_helper_app {
    name = "CtsPkgInstallerPermWhitelistApp";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "CtsPkgInstallerConstants"
        "testng"
    ];
    srcs = ["src/com/android/cts/packageinstallerpermissionwhitelistapp/PermissionWhitelistTest.kt"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    target_sdk_version = "29";
    #  sign this app with a different cert than CtsPkgInstallerPermRequestApp
    certificate = ":cts-testkey1";
};

in { inherit CtsPkgInstallerPermWhitelistApp; }
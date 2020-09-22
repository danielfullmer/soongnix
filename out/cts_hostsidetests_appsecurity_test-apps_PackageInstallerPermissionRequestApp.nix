{ android_test_helper_app, java_library }:
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

CtsPkgInstallerPermRequestApp = android_test_helper_app {
    name = "CtsPkgInstallerPermRequestApp";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "CtsPkgInstallerConstants"
    ];
    srcs = ["src/com/android/cts/packageinstallerpermissionrequestapp/PermissionRequestTest.kt"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    target_sdk_version = "29";
    #  sign this app with a different cert than CtsPkgInstallerPermWhitelistApp
    certificate = ":cts-testkey2";
};

CtsPkgInstallerConstants = java_library {
    name = "CtsPkgInstallerConstants";
    srcs = ["utils/src/android/appsecurity/cts/PackageSetInstallerConstants.kt"];
    host_supported = true;
};

in { inherit CtsPkgInstallerConstants CtsPkgInstallerPermRequestApp; }

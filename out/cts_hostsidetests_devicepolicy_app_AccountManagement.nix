{ android_test_helper_app }:
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

CtsAccountManagementDevicePolicyApp = android_test_helper_app {
    name = "CtsAccountManagementDevicePolicyApp";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
    srcs = [
        "src/com/android/cts/devicepolicy/accountmanagement/AccountManagementTest.java"
        "src/com/android/cts/devicepolicy/accountmanagement/AccountUtilsTest.java"
        "src/com/android/cts/devicepolicy/accountmanagement/MockAccountAuthenticator.java"
        "src/com/android/cts/devicepolicy/accountmanagement/MockAccountService.java"
    ];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "androidx.test.rules"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "current";
};

in { inherit CtsAccountManagementDevicePolicyApp; }

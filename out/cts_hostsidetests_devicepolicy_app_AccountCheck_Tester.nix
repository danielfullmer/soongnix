{ android_test_helper_app }:
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

CtsAccountCheckAuthAppTester = android_test_helper_app {
    name = "CtsAccountCheckAuthAppTester";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    srcs = ["src/com/android/cts/devicepolicy/accountcheck/tester/TestAuthenticator.java"];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "androidx.test.rules"
    ];
    sdk_version = "test_current";
    min_sdk_version = "25";
};

in { inherit CtsAccountCheckAuthAppTester; }
